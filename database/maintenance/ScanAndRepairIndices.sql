USE gym_attendance;
GO

CREATE PROCEDURE dbo.ScanAndRepairIndexes
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableName NVARCHAR(255);
    DECLARE @IndexName NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    -- Cursor to iterate over all user tables
    DECLARE IndexCursor CURSOR FOR
    SELECT 
        t.name AS TableName,
        i.name AS IndexName
    FROM 
        sys.indexes AS i
    INNER JOIN 
        sys.tables AS t ON t.object_id = i.object_id
    WHERE 
        i.index_id > 0 AND
        i.is_disabled = 0 AND
        i.is_hypothetical = 0 AND
        i.type_desc <> 'HEAP' AND
        t.is_ms_shipped = 0;

    -- Variables to store index repair statements
    DECLARE @RebuildIndexSQL NVARCHAR(MAX);
    DECLARE @ReorganizeIndexSQL NVARCHAR(MAX);

    -- Temporary table to store index fragmentation information
    CREATE TABLE #IndexFragmentation
    (
        TableName NVARCHAR(255),
        IndexName NVARCHAR(255),
        Fragmentation DECIMAL(18,2),
        IndexType NVARCHAR(60)
    );

    OPEN IndexCursor;

    -- Fetch the first index
    FETCH NEXT FROM IndexCursor INTO @TableName, @IndexName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Determine index fragmentation and index type
        SET @SQL = N'
            INSERT INTO #IndexFragmentation (TableName, IndexName, Fragmentation, IndexType)
            SELECT
                OBJECT_NAME(i.object_id) AS TableName,
                i.name AS IndexName,
                ISNULL(dps.avg_fragmentation_in_percent, 0) AS Fragmentation,
                i.type_desc AS IndexType
            FROM
                sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, ''LIMITED'') dps
            INNER JOIN
                sys.indexes i ON dps.object_id = i.object_id AND dps.index_id = i.index_id
            INNER JOIN
                sys.tables t ON t.object_id = i.object_id
            WHERE
                t.name = @TableName AND
                i.name = @IndexName;
        ';

        EXEC sp_executesql @SQL, N'@TableName NVARCHAR(255), @IndexName NVARCHAR(255)', @TableName, @IndexName;

        -- Determine the repair action based on index fragmentation
        SET @RebuildIndexSQL = N'ALTER INDEX ' + QUOTENAME(@IndexName) + N' ON ' + QUOTENAME(@TableName) + N' REBUILD;';
        SET @ReorganizeIndexSQL = N'ALTER INDEX ' + QUOTENAME(@IndexName) + N' ON ' + QUOTENAME(@TableName) + N' REORGANIZE;';

        IF EXISTS (
            SELECT 1
            FROM #IndexFragmentation
            WHERE TableName = @TableName AND IndexName = @IndexName AND Fragmentation > 30
        )
        BEGIN
            -- Index fragmentation is greater than 30%, rebuild index
            PRINT N'Rebuilding index ' + QUOTENAME(@IndexName) + N' on table ' + QUOTENAME(@TableName) + N'...';
            EXEC sp_executesql @RebuildIndexSQL;
        END
        ELSE IF EXISTS (
            SELECT 1
            FROM #IndexFragmentation
            WHERE TableName = @TableName AND IndexName = @IndexName AND Fragmentation > 10
        )
        BEGIN
            -- Index fragmentation is greater than 10%, reorganize index
            PRINT N'Reorganizing index ' + QUOTENAME(@IndexName) + N' on table ' + QUOTENAME(@TableName) + N'...';
            EXEC sp_executesql @ReorganizeIndexSQL;
        END

        -- Fetch the next index
        FETCH NEXT FROM IndexCursor INTO @TableName, @IndexName;
    END

    CLOSE IndexCursor;
    DEALLOCATE IndexCursor;

    -- Drop the temporary table
    DROP TABLE #IndexFragmentation;
END;
