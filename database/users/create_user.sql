CREATE PROCEDURE create_user(
    @name VARCHAR(255),
    @email VARCHAR(255),
    @password VARCHAR(255)
) AS BEGIN
INSERT INTO
    users (name, email, password_hash)
VALUES
    (@name, @email, crypt(@password, 'salt'));

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('create_user', ERROR_MESSAGE());

END;

END;