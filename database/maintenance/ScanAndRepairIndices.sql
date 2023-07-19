CREATE PROCEDURE dbo.ScanAndRepairIndices AS BEGIN
SET
    NOCOUNT ON;

DECLARE @table_name sysname;

DECLARE @index_name sysname;

DECLARE @index_id int;

DECLARE @index_type sysname;

DECLARE @index_state int;

DECLARE @index_type_desc sysname;

DECLARE @index_state_desc sysname;

DECLARE @rows_affected int;

DECLARE @bytes_processed bigint;

SELECT
    @table_name = name
FROM
    sys.tables
WHERE
    database_id = DB_ID('gym_attendance');

SELECT
    @index_name = name,
    @index_id = object_id,
    @index_type = type_desc,
    @index_state = state_desc
FROM
    sys.indexes
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
    @index_type_desc = CASE
        @index_type
        WHEN 'CLUSTERED' THEN 'Clustered Index'
        WHEN 'NONCLUSTERED' THEN 'Nonclustered Index'
    END;

SELECT
    @index_state_desc = CASE
        @index_state
        WHEN 0 THEN 'Healthy'
        WHEN 1 THEN 'Degraded'
        WHEN 2 THEN 'Suspected'
        WHEN 3 THEN 'Broken'
    END;

SELECT
    @rows_affected = 0,
    @bytes_processed = 0;

WHILE @index_name IS NOT NULL BEGIN IF @index_state = 3 BEGIN BEGIN TRY ALTER INDEX ALL ON @table_name REBUILD;

END TRY BEGIN CATCH PRINT 'Error rebuilding index ' + @index_name;

END CATCH;

END;

SELECT
    @rows_affected = @rows_affected + rows_affected,
    @bytes_processed = @bytes_processed + bytes_processed
FROM
    sys.dm_db_index_usage_stats
WHERE
    object_id = @table_name
    AND index_id = @index_id;

SELECT
    @index_name = NULL;

END;

PRINT 'Total rows affected: ' + CONVERT(VARCHAR(10), @rows_affected);

PRINT 'Total bytes processed: ' + CONVERT(VARCHAR(10), @bytes_processed);

END
GO