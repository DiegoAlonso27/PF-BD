USE gym_attendance;
GO

CREATE PROCEDURE sp_log_error (
    @procedure_name VARCHAR(255),
    @error_message VARCHAR(255)
) AS BEGIN
INSERT INTO
    error_log (procedure_name, error_message)
VALUES
    (@procedure_name, @error_message);

END;