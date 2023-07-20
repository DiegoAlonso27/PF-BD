USE msdb;
GO

-- Variables para la tarea programada
DECLARE @jobName NVARCHAR(128) = N'Backup Gym Attendance Job';
DECLARE @command NVARCHAR(4000) = N'EXEC dbo.BackupGymAttendanceDatabase;';
DECLARE @frequencyType INT = 4; -- Diario
DECLARE @frequencyInterval INT = 1; -- Repetir cada 1 días
DECLARE @frequencySubDayType INT = 4; -- Horas
DECLARE @frequencySubDayInterval INT = 1; -- Cada 1 horas
DECLARE @startTime NVARCHAR(10) = N'11:50'; -- Hora de inicio en formato HH:mm

-- Crear la tarea programada
EXEC msdb.dbo.sp_add_job
     @job_name = @jobName,
     @enabled = 1,
     @description = N'Tarea programada para realizar una copia de seguridad diaria de la base de datos Gym Attendance',
     @owner_login_name = N'sa'; -- Cambiar a tu usuario propietario, si es diferente de 'sa'

-- Configurar la programación de la tarea
EXEC msdb.dbo.sp_add_schedule
     @schedule_name = N'Daily Backup Schedule',
     @freq_type = @frequencyType,
     @freq_interval = @frequencyInterval,
     @freq_subday_type = @frequencySubDayType,
     @freq_subday_interval = @frequencySubDayInterval,
     @active_start_time = @startTime,
     @schedule_id = 1;

-- Asociar la programación con la tarea
EXEC msdb.dbo.sp_attach_schedule
     @job_name = @jobName,
     @schedule_id = 1;

-- Agregar el paso de trabajo a la tarea
EXEC msdb.dbo.sp_add_jobstep
     @job_name = @jobName,
     @step_name = N'Backup Step',
     @subsystem = N'TSQL',
     @command = @command;

-- Iniciar la tarea programada
EXEC msdb.dbo.sp_start_job @job_name = @jobName;
