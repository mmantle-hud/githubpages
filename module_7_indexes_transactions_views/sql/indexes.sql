-- 1. Create a clean test table
DROP TABLE IF EXISTS demo_students;

CREATE TABLE demo_students (
    student_id INT,
    given_name VARCHAR(255),
    family_name VARCHAR(255),
    CONSTRAINT pk_demo_students PRIMARY KEY (student_id)
);

-- 2. Insert 499,999 filler rows
INSERT INTO demo_students (student_id, given_name, family_name)
SELECT
    g.id,
    'John',
    'FillerLastName'
FROM generate_series(1, 499999) AS g(id);

-- 3. Check this has worked
SELECT * FROM demo_students LIMIT 100;
SELECT COUNT(*) FROM demo_students;

-- 3. Insert one target row
INSERT INTO demo_students (student_id, given_name, family_name)
VALUES (500000, 'Alice', 'Smith');

SELECT COUNT(*) FROM demo_students;
-- 4. Make sure PostgreSQL has up-to-date statistics
ANALYZE demo_students;

-- 5. Search without an index
EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM demo_students
WHERE family_name = 'Smith';

-- 6. Create an index
CREATE INDEX idx_demo_family_name
ON demo_students(family_name);

-- Use SQLTools to confirm the index has been created

-- 7. Update statistics
ANALYZE demo_students;

-- 8. Search with the index
EXPLAIN (ANALYZE, BUFFERS)
SELECT *
FROM demo_students
WHERE family_name = 'Smith';

-- 9. Remove the index
DROP INDEX idx_demo_family_name;
