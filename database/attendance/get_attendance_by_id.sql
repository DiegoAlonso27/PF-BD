USE gym_attendance;
GO

CREATE PROCEDURE get_attendance_by_id(@id INT) AS BEGIN
SELECT
    *
FROM
    attendance
WHERE
    attendance_id = @id;

END;