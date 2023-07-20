USE gym_attendance;
GO

-- Insertar tipos de membresías
INSERT INTO type_memberships (name, length, price)
VALUES ('Mensual', 1, 50.00),
       ('Bimestral', 2, 90.00),
       ('Trimestral', 3, 130.00),
       ('Semestral', 6, 240.00),
       ('Anual', 12, 450.00);
