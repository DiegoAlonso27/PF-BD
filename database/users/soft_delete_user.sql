USE gym_attendance;
GO

CREATE PROCEDURE soft_delete_user(@id INT) AS BEGIN
UPDATE
    users
SET
    deleted_at = CURRENT_TIMESTAMP
WHERE
    user_id = @id;

-- Call sp_log_error() if an error occurs
IF @@ERROR > 0 BEGIN EXEC sp_log_error 'soft_delete_user',
ERROR_MESSAGE;

END;

END;