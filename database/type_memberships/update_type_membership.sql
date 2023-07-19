CREATE PROCEDURE update_type_membership(
    @id INT,
    @name VARCHAR(255),
    @length INT,
    @price DECIMAL(10, 2)
) AS BEGIN
UPDATE
    type_memberships
SET
    name = @name,
    length = @length,
    price = @price,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('update_type_membership', ERROR_MESSAGE());

END;

END;