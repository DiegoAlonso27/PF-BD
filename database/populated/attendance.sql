USE gym_attendance;
GO

DECLARE @currentDate DATE = GETDATE();
DECLARE @endDate DATE = DATEADD(DAY, 13, @currentDate); -- Fecha dentro de dos semanas

WHILE @currentDate <= @endDate
BEGIN
    -- Ejecutar el procedimiento almacenado para la fecha actual
    EXEC GenerateAttendanceForDate @currentDate;

    -- Avanzar al siguiente día
    SET @currentDate = DATEADD(DAY, 1, @currentDate);
END
