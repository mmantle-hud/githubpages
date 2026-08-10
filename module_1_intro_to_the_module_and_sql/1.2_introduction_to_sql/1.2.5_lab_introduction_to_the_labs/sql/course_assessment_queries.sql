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