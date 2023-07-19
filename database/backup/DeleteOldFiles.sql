USE gym_attendance;
GO

CREATE PROCEDURE dbo.DeleteOldBackupFiles
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FilePath NVARCHAR(255);
    DECLARE @FilePattern NVARCHAR(255);
    DECLARE @OlderThanDate DATETIME;

    -- Set the file path and file pattern
    SET @FilePath = N'D:\BACKUP\';
    SET @FilePattern = N'*.*';

    -- Calculate the date 3 days ago
    SET @OlderThanDate = DATEADD(DAY, -3, GETDATE());

    -- Delete old backup files
    DECLARE @DeleteSQL NVARCHAR(MAX);
    SET @DeleteSQL = N'
        EXEC xp_cmdshell ''del "' + @FilePath + @FilePattern + N'" /Q'''
        + N' WHERE CREATE_DATE < ''' + CONVERT(NVARCHAR(30), @OlderThanDate, 120) + N'''';

    EXEC sp_executesql @DeleteSQL;

    -- Call sp_log_error() if an error occurs
    IF @@ERROR > 0
    BEGIN
        EXEC sp_log_error 'DeleteOldBackupFiles', ERROR_MESSAGE;
    END;
END;
