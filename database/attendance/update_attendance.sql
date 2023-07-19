CREATE PROCEDURE update_attendance(
    @id INT,
    @client_id INT,
    @user_id INT,
    @date_attendance DATETIME2,
    @type_assistances INT,
    @valid BOOLEAN
) AS BEGIN
UPDATE
    attendance
SET
    client_id = @client_id,
    user_id = @user_id,
    date_attendance = @date_attendance,
    type_assistances = @type_assistances,
    valid = @valid,
    updated_at = CURRENT_TIMESTAMP
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('update_attendance', ERROR_MESSAGE());

END;

END;