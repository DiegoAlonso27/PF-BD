USE gym_attendance;
GO

CREATE PROCEDURE dbo.ScanAndRepairData AS BEGIN
SET
    NOCOUNT ON;

DECLARE @table_name sysname;

DECLARE @column_name sysname;

DECLARE @row_count int;

DECLARE @bytes_processed bigint;

SELECT
    @table_name = name
FROM
    sys.tables
WHERE
    database_id = DB_ID('gym_attendance');

SELECT
    @column_name = name
FROM
    sys.columns
WHERE
    object_id IN (
        SELECT
            object_id
        FROM
            sys.tables
        WHERE
            database_id = DB_ID('gym_attendance')
    );

SELECT
    @row_count = 0,
    @bytes_processed = 0;

WHILE @table_name IS NOT NULL BEGIN WHILE @column_name IS NOT NULL BEGIN BEGIN TRY DBCC CHECKIDENT (@table_name, RESEED, @row_count);

END TRY BEGIN CATCH PRINT 'Error checking identity ' + @table_name + '.' + @column_name;

END CATCH;

SELECT
    @row_count = @row_count + 1,
    @bytes_processed = @bytes_processed + 8
FROM
    sys.dm_db_index_usage_stats
WHERE
    object_id = OBJECT_ID(@table_name)
    AND index_id = INDEXPROPERTY(OBJECT_ID(@table_name), name = @column_name, 2);

SELECT
    @column_name = NULL;

END;

SELECT
    @table_name = NULL;

END;

PRINT 'Total rows affected: ' + CONVERT(VARCHAR(10), @row_count);

PRINT 'Total bytes processed: ' + CONVERT(VARCHAR(10), @bytes_processed);

-- Call sp_log_error() if an error occurs
    IF @@ERROR > 0
    BEGIN
        EXEC sp_log_error 'ScanAndRepairData', ERROR_MESSAGE;
    END;

END
GO