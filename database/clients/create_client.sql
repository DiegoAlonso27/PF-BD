USE gym_attendance;
GO

CREATE PROCEDURE create_client(
    @name VARCHAR(255),
    @address VARCHAR(255),
    @phone_number VARCHAR(255),
    @email VARCHAR(255),
    @date_of_birth DATE
) AS BEGIN
INSERT INTO
    clients (
        name,
        address,
        phone_number,
        email,
        date_of_birth,
        created_at,
        updated_at,
        deleted_at
    )
VALUES
    (
        @name,
        @address,
        @phone_number,
        @email,
        @date_of_birth,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL
    );

-- Call sp_log_error() if an error occurs
    IF @@ERROR > 0
    BEGIN
        EXEC sp_log_error 'create_client', ERROR_MESSAGE;
    END;

END;