USE gym_attendance;
GO

CREATE PROCEDURE get_type_membership_by_id(@id INT) AS BEGIN
SELECT
    *
FROM
    type_memberships
WHERE
    type_membership_id = @id;

END;