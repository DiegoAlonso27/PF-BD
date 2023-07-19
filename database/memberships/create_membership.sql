CREATE PROCEDURE create_membership(
    @client_id INT,
    @type_membership_id INT,
    @start_date DATE,
    @end_date DATE,
    @price DECIMAL(10, 2)
) AS BEGIN
INSERT INTO
    memberships (
        client_id,
        type_membership_id,
        start_date,
        end_date,
        price,
        created_at,
        updated_at,
        deleted_at
    )
VALUES
    (
        @client_id,
        @type_membership_id,
        @start_date,
        @end_date,
        @price,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        NULL
    );

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('create_membership', ERROR_MESSAGE());

END;

END;