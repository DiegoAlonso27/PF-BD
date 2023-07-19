USE gym_attendance;
GO

CREATE PROCEDURE create_attendance(
    @client_id INT,
    @user_id INT,
    @date_attendance DATETIME2,
    @type_assistances INT,
    @valid BIT
) AS BEGIN
INSERT INTO
    attendance (
        client_id,
        user_id,
        date_attendance,
        type_assistances,
        valid,
        created_at,
        updated_at,
        deleted_at
    )
VALUES
    (
        @client_id,
        @user_id,
        @date_attendance,
        @type_assistances,
        @valid,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL
    );

-- Call sp_log_error() if an error occurs
    IF @@ERROR > 0
    BEGIN
        EXEC sp_log_error 'create_attendance', ERROR_MESSAGE;
    END;

END;
