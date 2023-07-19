USE gym_attendance;
GO

CREATE PROCEDURE update_user
(
    @id INT,
    @name VARCHAR(255),
    @email VARCHAR(255),
    @password VARCHAR(255)
)
AS
BEGIN
    UPDATE users
    SET name = @name,
        email = @email,
        password = @password,
        password_hash = HASHBYTES('SHA2_256', @password),
		updated_at = CURRENT_TIMESTAMP
    WHERE user_id = @id;

    -- Call sp_log_error() if an error occurs
    IF @@ERROR > 0
    BEGIN
        EXEC sp_log_error 'update_user', ERROR_MESSAGE;
    END;
END;
