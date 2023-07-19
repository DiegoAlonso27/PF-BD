USE gym_attendance;
GO

CREATE PROCEDURE dbo.BackupGymAttendanceDatabase AS BEGIN
SET
    NOCOUNT ON;

DECLARE @Bd varchar(50) DECLARE @rutaCopia varchar(100) DECLARE @fechaTexto varchar(200) DECLARE @horaTexto varchar(200)
set
    @fechaTexto = RIGHT(
        '0' + cast(DATEPART(DAY, getdate()) as varchar(2)),
        2
    ) + RIGHT(
        '0' + cast(DATEPART(MONTH, getdate()) as varchar(2)),
        2
    ) + cast(DATEPART(YYYY, getdate()) as varchar(4))
set
    @horaTexto = RIGHT(
        '0' + cast(DATEPART(HH, getdate()) as varchar(2)),
        2
    ) + RIGHT(
        '0' + cast(DATEPART(MI, getdate()) as varchar(2)),
        2
    ) + RIGHT(
        '0' + cast(DATEPART(SS, getdate()) as varchar(2)),
        2
    )
set
    @Bd =(
        select
            DB_NAME()
    )
set
    @rutaCopia = 'D:\BACKUP\'
    set @rutaCopia=@rutaCopia+@Bd+@fechaTexto+' _ '+@horaTexto+'.bak '

    BACKUP DATABASE @Bd
    TO DISK = @rutaCopia
    WITH INIT,
    COMPRESSION,
    STATS = 10;
END
GO