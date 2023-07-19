CREATE PROCEDURE get_membership_by_id(@id INT) AS BEGIN
SELECT
    *
FROM
    memberships
WHERE
    id = @id;

END;