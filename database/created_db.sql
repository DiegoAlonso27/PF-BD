USE master;

IF EXISTS (
    SELECT
        name
    FROM
        master.dbo.sysdatabases
    WHERE
        name = N'gym_attendance'
) DROP DATABASE gym_attendance;

CREATE DATABASE gym_attendance;

USE gym_attendance;

CREATE TABLE users (
    user_id INT IDENTITY(1, 1) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME2 NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE clients (
    client_id INT IDENTITY(1, 1) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME2 NULL,
    PRIMARY KEY (client_id)
);

CREATE TABLE attendance (
    attendance_id INT IDENTITY(1, 1) NOT NULL,
    client_id INT NOT NULL,
    user_id INT NOT NULL,
    date_attendance DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_assistances INT NOT NULL, -- 0 = check in, 1 = check out
    valid BOOLEAN NOT NULL, -- 0 = false, 1 = true
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME2 NULL,
    PRIMARY KEY (attendance_id),
    FOREIGN KEY (client_id) REFERENCES clients (client_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
);

CREATE TABLE type_memberships ( -- mensuales, trimestrales, semestrales, etc
    type_membership_id INT IDENTITY(1, 1) NOT NULL,
    name VARCHAR(255) NOT NULL,
    length INT NOT NULL, -- 1 = mensual, 3 = trimestral, 6 = semestral, 12 = anual
    price DECIMAL(10, 2) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME2 NULL,
    PRIMARY KEY (type_membership_id)

);

CREATE TABLE memberships (
    membership_id INT IDENTITY(1, 1) NOT NULL,
    client_id INT NOT NULL,
    type_membership_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME2 NULL,
    PRIMARY KEY (membership_id),
    FOREIGN KEY (client_id) REFERENCES clients (client_id)
    FOREIGN KEY (type_membership_id) REFERENCES type_memberships (type_membership_id)
);

CREATE TABLE error_log (
  id INT IDENTITY(1,1) NOT NULL,
  procedure_name VARCHAR(255) NOT NULL,
  error_message VARCHAR(255) NOT NULL,
  error_date DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

-- Create index on clients (name, email)
CREATE INDEX clients_name_email_index ON clients (name, email);

-- Create index on attendance (client_id, date_attendance)
CREATE INDEX attendance_client_id_date_attendance_index ON attendance (client_id, date_attendance);

-- Create index on memberships (client_id, type_membership_id)
CREATE INDEX memberships_client_id_type_membership_id_index ON memberships (client_id, type_membership_id);

-- Create index on error_log (procedure_name, error_message)
CREATE INDEX error_log_procedure_name_error_message_index ON error_log (procedure_name, error_message);

