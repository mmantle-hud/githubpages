DROP TABLE IF EXISTS passports;

DROP TABLE IF EXISTS people;

CREATE TABLE people (
    person_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255) NOT NULL,
    family_name VARCHAR(255) NULL,
    date_of_birth DATE NOT NULL,
    CONSTRAINT pk_people PRIMARY KEY (person_id)
);

CREATE TABLE passports (
    passport_number CHAR(9),
    date_of_issue DATE NOT NULL,
    person_id INT NOT NULL UNIQUE,
    CONSTRAINT pk_passports PRIMARY KEY (passport_number),
    CONSTRAINT fk_passports_people FOREIGN KEY (person_id) REFERENCES people(person_id) ON DELETE CASCADE
);

INSERT INTO
    people (given_name, family_name, date_of_birth)
VALUES
    ('Sarah', 'Jones', '1992-11-23'),
    ('Aisha', 'Kahn', '1994-03-14'),
    ('Kwame', 'Mensah', '1997-05-19');

-- 2. Insert records into the passports table 
-- (Matching person_id values 1, 2, and 3)
INSERT INTO
    passports (passport_number, person_id, date_of_issue)
VALUES
    ('503214567', 1, '2019-06-12'),
    ('508765432', 2, '2022-10-25'),
    ('501472583', 3, '2025-02-18');

SELECT
    *
FROM
    people;

SELECT
    *
FROM
    passports;

SELECT
    CONCAT(p.given_name, ' ', p.family_name) AS full_name,
    pa.passport_number
FROM
    people AS p
    INNER JOIN passports AS pa ON p.person_id = pa.person_id;