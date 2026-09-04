-- Example query
SELECT given_name,
    family_name,
    mark
FROM students
ORDER BY mark DESC;
-- Another example query
SELECT *
FROM students
WHERE mark > 90;

-- Example SELECT statement
SELECT * FROM students;
-- Example UPDATE statement
UPDATE students 
SET mark=61 WHERE student_id=6;