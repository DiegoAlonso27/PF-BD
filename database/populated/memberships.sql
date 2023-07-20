USE gym_attendance;
GO

-- Asignar membresías aleatorias a los clientes
INSERT INTO memberships (client_id, type_membership_id, start_date, end_date, price)
SELECT
    client_id,
    type_membership_id,
    GETDATE() AS start_date, -- Fecha actual como fecha de inicio
    DATEADD(MONTH, length, GETDATE()) AS end_date, -- Fecha de inicio + duración de la membresía en meses como fecha de finalización
    price
FROM
(
    SELECT
        c.client_id,
        tm.type_membership_id,
        tm.length,
        tm.price,
        ROW_NUMBER() OVER (PARTITION BY c.client_id ORDER BY NEWID()) AS row_num
    FROM
        clients c
    CROSS JOIN
        type_memberships tm
) AS temp
WHERE
    row_num = 1;
