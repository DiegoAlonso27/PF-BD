CREATE PROCEDURE soft_delete_client(@id INT) AS BEGIN
UPDATE
    clients
SET
    deleted_at = CURRENT_TIMESTAMP
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('soft_delete_client', ERROR_MESSAGE());

END;

END;