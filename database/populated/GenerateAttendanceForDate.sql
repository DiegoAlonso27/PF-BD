USE gym_attendance;
GO

CREATE PROCEDURE GenerateAttendanceForDate
    @attendanceDate DATE
AS
BEGIN

    DECLARE @timeInterval INT = 20; -- Intervalo de tiempo mínimo en minutos (20 minutos)
    DECLARE @timeRange INT = 180; -- Rango de tiempo máximo en minutos (3 horas)

    DECLARE @currentClientID INT;
    DECLARE @checkInDateTime DATETIME;
    DECLARE @checkOutDateTime DATETIME;

    -- Obtener la lista de todos los clientes
    DECLARE client_cursor CURSOR FOR
    SELECT client_id
    FROM clients;

    OPEN client_cursor;

    FETCH NEXT FROM client_cursor INTO @currentClientID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Generar el tiempo de check in aleatorio para la fecha proporcionada
        SET @checkInDateTime = DATEADD(MINUTE, FLOOR(RAND(CHECKSUM(NEWID())) * (24 * 60)), CAST(@attendanceDate AS DATETIME));

        -- Generar el tiempo de check out aleatorio entre 20 minutos y 3 horas después del check in
        SET @checkOutDateTime = DATEADD(MINUTE, FLOOR(RAND(CHECKSUM(NEWID())) * (@timeRange - @timeInterval + 1)) + @timeInterval, @checkInDateTime);

        -- Insertar el registro de check in
        INSERT INTO attendance (client_id, user_id, date_attendance, type_assistances, valid)
        VALUES (@currentClientID, 11, @checkInDateTime, 0, 1);

        -- Insertar el registro de check out
        INSERT INTO attendance (client_id, user_id, date_attendance, type_assistances, valid)
        VALUES (@currentClientID, 11, @checkOutDateTime, 1, 1);

        FETCH NEXT FROM client_cursor INTO @currentClientID;
    END

    CLOSE client_cursor;
    DEALLOCATE client_cursor;
END;
