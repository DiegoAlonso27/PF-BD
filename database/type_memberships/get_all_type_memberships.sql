USE gym_attendance;
GO

CREATE PROCEDURE get_all_type_memberships AS BEGIN
SELECT
    *
FROM
    type_memberships;

END;