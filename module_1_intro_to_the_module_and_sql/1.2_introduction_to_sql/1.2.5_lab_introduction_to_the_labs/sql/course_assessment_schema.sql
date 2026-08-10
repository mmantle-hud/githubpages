-- DROP deletes a table
DROP TABLE IF EXISTS students;
-- Example CREATE TABLE statement
CREATE TABLE students (
    student_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255) NOT NULL,
    family_name VARCHAR(255) NULL,
    degree VARCHAR(255) NOT NULL,
    score SMALLINT NULL,
    CONSTRAINT pk_students PRIMARY KEY (student_id),
    CONSTRAINT chk_students_score CHECK (
        mark BETWEEN 0 AND 100
    )
);