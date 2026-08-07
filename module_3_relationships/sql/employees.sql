DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255) NOT NULL,
    family_name VARCHAR(255) NULL,
    manager_id INT NULL,
    -- The self-referencing foreign key
    CONSTRAINT pk_employees PRIMARY KEY (employee_id),
    CONSTRAINT fk_employee_manager FOREIGN KEY (manager_id) REFERENCES employees(employee_id) ON DELETE
    SET
        NULL
);

INSERT INTO
    employees (given_name, family_name, manager_id)
VALUES
    ('Kwame', 'Mensah', NULL),
    ('Sara', 'Jones', 1),
    ('Usman', 'Hussain', 1),
    ('Tom', 'Smith', 2);

SELECT
    *
FROM
    employees;

SELECT
    CONCAT(e.given_name, ' ', e.family_name) AS employee,
    CONCAT(m.given_name, ' ', m.family_name) AS manager
FROM
    employees AS e
    INNER JOIN employees AS m ON e.manager_id = m.employee_id;