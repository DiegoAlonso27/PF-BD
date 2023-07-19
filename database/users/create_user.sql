USE gym_attendance;
GO

CREATE PROCEDURE create_user
(
    @name VARCHAR(255),
    @email VARCHAR(255),
    @password VARCHAR(255)
)
AS
BEGIN
    INSERT INTO users (name, email, password, password_hash)
    VALUES (@name, @email, @password, HASHBYTES('SHA2_256', @password));
    
    -- Call sp_log_error() if an error occurs
    IF @@ERROR > 0
    BEGIN
        -- Incorrect syntax near ')'.
        EXEC dbo.sp_log_error 'create_user', ERROR_MESSAGE;
    END;
END;
GO
