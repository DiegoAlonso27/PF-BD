CREATE PROCEDURE get_client_by_id(@id INT) AS BEGIN
SELECT
    *
FROM
    clients
WHERE
    id = @id;

-- Call sp_log_error() if an error occurs
IF @ @ERROR > 0 BEGIN sp_log_error('get_client_by_id', ERROR_MESSAGE());

END;

END;