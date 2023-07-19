CREATE PROCEDURE get_attendance_by_id(@id INT) AS BEGIN
SELECT
    *
FROM
    attendance
WHERE
    id = @id;

END;