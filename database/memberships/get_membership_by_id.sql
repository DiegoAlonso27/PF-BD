USE gym_attendance;
GO

CREATE PROCEDURE get_membership_by_id(@id INT) AS BEGIN
SELECT
    *
FROM
    memberships
WHERE
    membership_id = @id;

END;