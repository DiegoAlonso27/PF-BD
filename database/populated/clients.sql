USE gym_attendance;
GO

-- Ejemplo de uso del procedimiento almacenado para crear 100 clientes
DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN
    DECLARE @name VARCHAR(255) = 'Cliente' + CAST(@i AS VARCHAR(3));
    DECLARE @address VARCHAR(255) = 'Dirección cliente' + CAST(@i AS VARCHAR(3));
    DECLARE @phone_number VARCHAR(255) = '123-456-789' + CAST(@i AS VARCHAR(3));
    DECLARE @email VARCHAR(255) = 'cliente' + CAST(@i AS VARCHAR(3)) + '@example.com';
    DECLARE @date_of_birth DATE = DATEADD(YEAR, -30, GETDATE()); -- Fecha de nacimiento hace aproximadamente 30 años

    -- Llamar al procedimiento almacenado para crear un cliente
    EXEC create_client @name, @address, @phone_number, @email, @date_of_birth;

    SET @i = @i + 1;
END;
