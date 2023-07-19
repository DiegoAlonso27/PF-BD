USE gym_attendance;
GO

CREATE PROCEDURE dbo.PerformDifferentialBackup
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DatabaseName NVARCHAR(128);
    DECLARE @BackupPath NVARCHAR(260);
    DECLARE @BackupFileName NVARCHAR(260);

    -- Set the database name
    SET @DatabaseName = N'gym_attendance';

    -- Set the backup path
    SET @BackupPath = N'D:\BACKUP\DIFFERENTIAL\';

    -- Create the backup file name with current timestamp
    SET @BackupFileName = @BackupPath + @DatabaseName + N'_' + REPLACE(CONVERT(NVARCHAR(30), GETDATE(), 120), N':', N'') + N'.bak';

    -- Perform the differential backup
    BACKUP DATABASE @DatabaseName
    TO DISK = @BackupFileName
    WITH DIFFERENTIAL;

    -- Optionally, you can add more backup options like compression, encryption, etc.

    -- Log the backup operation
    INSERT INTO error_log (procedure_name, error_message)
    VALUES ('dbo.PerformDifferentialBackup', 'Differential backup of database ' + @DatabaseName + ' completed.');

    PRINT 'Differential backup completed. Backup file: ' + @BackupFileName;
END;
