-- Quickly deletes all data in a table
TRUNCATE TABLE students RESTART IDENTITY;
-- Seed data with example students
INSERT INTO students (given_name, family_name, degree, mark)
VALUES ('Edgar', 'Codd', 'Computing', 92),
    ('Elizabeth', 'Fong', 'Data Science', 67),
    ('Patricia', 'Selinger', 'Computing', 85),
    (
        'Donald',
        'Chamberlin',
        'Information Technology',
        85
    ),
    ('Michael', 'Stonebraker', 'Data Science', 34),
    ('Jennifer', 'Widom', 'Computing', 47);