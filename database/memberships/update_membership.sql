CREATE PROCEDURE update_membership(
    @id INT,
    @client_id INT,
    @type_membership_id INT,
    @start_date DATE,
    @end_date DATE,
    @price DECIMAL(10, 2)
) AS BEGIN
UPDATE
    memberships
SET
    client_id = @client_id,
    type_membership_id = @type_membership_id,
    start_date = @start_date,
    end_date = @end_date,
    price = @price,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('update_membership', ERROR_MESSAGE());

END;

END;