USE gym_attendance;
GO

CREATE PROCEDURE get_all_memberships AS BEGIN
SELECT
    *
FROM
    memberships;

END;