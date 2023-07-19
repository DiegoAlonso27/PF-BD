USE gym_attendance;
GO

CREATE PROCEDURE get_all_attendances AS BEGIN
SELECT
    *
FROM
    attendance;

END;