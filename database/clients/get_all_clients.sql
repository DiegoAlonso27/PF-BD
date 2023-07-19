USE gym_attendance;
GO

CREATE PROCEDURE get_all_clients AS BEGIN
SELECT
    *
FROM
    clients;

-- Call sp_log_error() if an error occurs
IF @@ERROR > 0
    BEGIN
        EXEC sp_log_error 'get_all_clients', ERROR_MESSAGE;
    END;

END;