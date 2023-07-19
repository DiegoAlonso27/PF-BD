CREATE PROCEDURE soft_delete_membership(@id INT) AS BEGIN
UPDATE
    memberships
SET
    deleted_at = CURRENT_TIMESTAMP
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('soft_delete_membership', ERROR_MESSAGE());

END;

END;