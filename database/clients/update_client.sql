CREATE PROCEDURE update_client(
    @id INT,
    @name VARCHAR(255),
    @address VARCHAR(255),
    @phone_number VARCHAR(255),
    @email VARCHAR(255),
    @date_of_birth DATE
) AS BEGIN
UPDATE
    clients
SET
    name = @name,
    address = @address,
    phone_number = @phone_number,
    email = @email,
    date_of_birth = @date_of_birth,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('update_client', ERROR_MESSAGE());

END;

END;