CREATE PROCEDURE dbo.DeleteOldFiles
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @path NVARCHAR(255) = N'D:\BACKUP\';

    DECLARE @filelist TABLE (
        filename NVARCHAR(255)
    );

    INSERT INTO @filelist (filename)
    SELECT filename
    FROM master..sysfiles
    WHERE filename LIKE N'%.bak'
    AND datediff(day, getdate(), lastwritetime) > 3;

    DECLARE @count INT = 0;

    SELECT @count = @count + 1
    FROM @filelist;

    IF @count > 0
    BEGIN
        DELETE FROM master..sysfiles
        WHERE filename IN (SELECT filename FROM @filelist);
    END;
END
GO
