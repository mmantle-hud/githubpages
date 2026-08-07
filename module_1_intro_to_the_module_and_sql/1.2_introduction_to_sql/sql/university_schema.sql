DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255) NOT NULL,
    family_name VARCHAR(255) NULL,
    course VARCHAR(255) NOT NULL,
    mark SMALLINT NULL,
    CONSTRAINT pk_students PRIMARY KEY (student_id),
    CONSTRAINT chk_students_mark CHECK (mark BETWEEN 0 AND 100)
);