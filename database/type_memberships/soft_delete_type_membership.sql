CREATE PROCEDURE soft_delete_type_membership(@id INT) AS BEGIN
UPDATE
    type_memberships
SET
    deleted_at = CURRENT_TIMESTAMP
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('soft_delete_type_membership', ERROR_MESSAGE());

END;

END;