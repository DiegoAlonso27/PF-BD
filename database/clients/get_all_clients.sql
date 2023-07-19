CREATE PROCEDURE get_all_clients() AS BEGIN
SELECT
    *
FROM
    clients;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('get_all_clients', ERROR_MESSAGE());

END;

END;