USE gym_attendance;
GO

-- Ejemplo de uso del procedimiento almacenado para crear 10 usuarios
DECLARE @i INT = 1;

WHILE @i <= 10
BEGIN
    DECLARE @name VARCHAR(255) = 'Usuario' + CAST(@i AS VARCHAR(2));
    DECLARE @email VARCHAR(255) = 'usuario' + CAST(@i AS VARCHAR(2)) + '@example.com';
    DECLARE @password VARCHAR(255) = 'contrasena' + CAST(@i AS VARCHAR(2));

    -- Llamar al procedimiento almacenado para crear un usuario
    EXEC create_user @name, @email, @password;

    SET @i = @i + 1;
END;
