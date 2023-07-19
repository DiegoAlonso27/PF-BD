USE gym_attendance;
GO

CREATE PROCEDURE create_type_membership(
    @name VARCHAR(255),
    @length INT,
    @price DECIMAL(10, 2)
) AS BEGIN
INSERT INTO
    type_memberships (
        name,
        length,
        price,
        created_at,
        updated_at,
        deleted_at
    )
VALUES
    (
        @name,
        @length,
        @price,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL
    );

-- Call sp_log_error() if an error occurs
    IF @@ERROR > 0
    BEGIN
        EXEC sp_log_error 'create_type_membership', ERROR_MESSAGE;
    END;

END;