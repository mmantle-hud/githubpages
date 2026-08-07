TRUNCATE TABLE students RESTART IDENTITY;


INSERT INTO students (given_name, family_name, course, mark)
    VALUES ('Edgar','Codd','Computing',92);

INSERT INTO students (given_name, family_name, course, mark) 
VALUES
('Elizabeth', 'Fong', 'Data Science', 67),
('Patricia', 'Selinger', 'Computing', 85),
('Donald', 'Chamberlin', 'Information Technology', 85),
('Michael', 'Stonebraker', 'Data Science', 34),
('Jennifer', 'Widom', 'Computing', NULL);