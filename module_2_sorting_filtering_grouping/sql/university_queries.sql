SELECT degree,
    AVG(mark) AS average_mark
FROM students
GROUP BY degree
HAVING AVG(mark) > 70;
-- Basic search
-- SELECT first_name, last_name, course
-- FROM students;
-- Using Distinct
-- SELECT DISTINCT course
-- FROM students;
-- Using WHERE (string comparison)
-- SELECT last_name,
--        first_name,
--        mark
-- FROM students
-- Using greater than operator
-- WHERE course = 'Data Science';
-- SELECT last_name,
--        first_name,
--        course,
--        mark
-- FROM students
-- WHERE mark >= 40;
-- LIKE
-- SELECT first_name,
--        last_name
-- FROM students;
-- using LIKE
-- WHERE last_name LIKE 'H%';
-- SELECT first_name,
--        last_name
-- FROM students
-- using like case-insensitive
-- WHERE last_name ILIKE '%l%';
-- using IN and NOT IN
-- SELECT first_name, last_name course FROM students
-- WHERE course IN ('Data Science','IT');
-- Using AND
-- SELECT first_name, last_name, mark FROM students
-- WHERE course = 'IT' AND mark >50;
-- Using parnentheses
-- SELECT first_name, last_name, course, mark
-- FROM students
-- WHERE (course = 'Data Science' OR course = 'IT')
--   AND mark < 40;
-- Ordering results
-- SELECT first_name, last_name, mark FROM students
-- ORDER BY mark DESC;
SELECT given_name,
    family_name,
    mark
FROM students
ORDER BY mark DESC,
    family_name ASC;
-- Limiting results
-- SELECT first_name, last_name, mark FROM students
-- ORDER BY mark DESC LIMIT 3;
-- using an Offset
-- SELECT first_name, last_name, mark FROM students
-- ORDER BY mark DESC LIMIT 3 OFFSET 3;
-- Using COUNT
-- SELECT COUNT(*) AS number_of_students
-- FROM students;
-- Aggregate functions group by first
-- SELECT course
-- FROM students
-- GROUP BY course;
-- Group by and count
-- SELECT course, count(*) AS number_of_students
-- FROM students
-- GROUP BY course;
-- Average mark
-- SELECT AVG(mark) AS avg_mark
-- FROM students;
-- Min, Max etc.
-- SELECT course, AVG(mark) AS avg_mark, MAX(mark) AS max_mark, MIN(mark) AS min_mark
-- FROM students
-- GROUP BY course;
-- Count number of students on a course
--  SELECT course, COUNT(*) AS number_of_students
-- FROM students
-- GROUP BY course;
-- Average mark for the students on a course
-- SELECT course, AVG(mark) AS avg_mark
-- FROM students
-- GROUP BY course
-- ORDER BY avg_mark DESC;
-- Having
-- SELECT course, COUNT(*) AS num_students
-- FROM students
-- GROUP BY course
-- HAVING COUNT(*) > 1;
--Average mark per course for all courses with an average mark over 50.
-- SELECT course, AVG(mark) AS avg_mark
-- FROM students
-- GROUP BY course
-- HAVING AVG(mark) > 50;
--Combining
-- SELECT course,
--        COUNT(*) AS total_enrolled,
--        AVG(mark) AS course_average
-- FROM public.students
-- WHERE mark IS NOT NULL 
-- GROUP BY course
-- HAVING COUNT(*) > 1 
-- ORDER BY course_average DESC; 
-- Using NOT NULL
-- SELECT first_name, last_name, mark
-- FROM public.students
-- WHERE mark IS NOT NULL
-- ORDER BY mark ASC
-- Numeric functions
-- SELECT course, ROUND(AVG(mark),1) AS avg_mark
-- FROM students
-- GROUP BY course
-- ORDER BY avg_mark DESC;
-- String functions
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
    course,
    mark
FROM students
WHERE mark IS NOT NULL;