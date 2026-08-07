SELECT *
FROM movies;
--     Display a unique list of all release years for movies in the database. 
SELECT DISTINCT release_year
FROM movies;
--     Display a unique list of all release years for movies in the database ordered by year of release with the most recent movies first. 
SELECT DISTINCT release_year
FROM movies
ORDER BY release_year DESC;
--     Display the title and year of all the movies that were made in 2017. 
SELECT title,
    release_year
FROM movies
WHERE release_year = 2017;
--     Display the title and duration of all the movies that are at least three hours in length.
SELECT title,
    duration_in_minutes
FROM movies
WHERE duration_in_minutes >= 180;
--   Display the title and duration of these movies in order, from the longest duration to the shortest.
SELECT title,
    duration_in_minutes
FROM movies
WHERE duration_in_minutes >= 180
ORDER BY duration_in_minutes DESC;
--     Display the title, year and duration of all the movies that were made in 2017 and are over 100 minutes in length. 
SELECT title,
    release_year
FROM movies
WHERE release_year = 2017
    AND duration_in_minutes > 100;
--     Display the title and year of all the movies that were made in the 1990s. 
SELECT title,
    release_year
FROM movies
WHERE release_year >= 1990
    AND release_year < 2000;
--     Display the title of all the movies that have a title that starts with the word 'The'.
SELECT title
FROM movies
WHERE title LIKE 'The%';
--     Display the title and year of all the movies that have a title that starts with the word 'The' and were released in the 20th century.
SELECT title,
    release_year
FROM movies
WHERE title LIKE 'The%'
    AND release_year >= 2000;
--     Display the title of all the movies that have a title that contains the word 'the'. This should be a case insenstive search.
SELECT title
FROM movies
WHERE title LIKE 'The %'
    OR title ILIKE '% the %';
--     Display the title of all the movies except for Frozen and Nw Zha 2 that have a title that contains the letter 'z'.
SELECT title
FROM movies
WHERE title ILIKE '%z%'
    AND title NOT IN ('Frozen', 'Ne Zha 2');
--     Display the title and duration of the three shortest movies.
SELECT title,
    duration_in_minutes
FROM movies
ORDER BY duration_in_minutes ASC
LIMIT 3;
--     Display the title and year of the 4th and 5th oldest movies.
SELECT title,
    release_year
FROM movies
ORDER BY release_year ASC
LIMIT 2 OFFSET 3;
-- For all the movies longer than 2 hours in length display the movie and titles in the format 'title(release_year)'' e.g. Titanic (1997)
SELECT CONCAT(title, '(', release_year, ')') AS title_and_year
FROM movies
WHERE duration_in_minutes > 120;
--     List the total number of movies in the table
SELECT COUNT(*) AS total_num_movies
FROM movies;
--     List the total duration of all the movies in the table
SELECT SUM(duration_in_minutes) AS total_duration
FROM movies;
--     List all the different years (no duplicates) in the table
SELECT DISTINCT(release_year)
FROM movies
ORDER BY release_year DESC;
--     Display the average duration of all the movies in the database rounded to the nearest minute.
SELECT ROUND(AVG(duration_in_minutes), 0) AS average_duration
FROM movies;
--     Display the average duration of all the movies made in the 21st century
SELECT ROUND(AVG(duration_in_minutes), 0) AS average_duration
FROM movies
WHERE release_year >= 2000;
--     List each year and the number of movies made in that year
SELECT release_year,
    COUNT(title) AS num_of_movies
FROM movies
GROUP BY release_year
ORDER BY num_of_movies DESC;
--     List each year. For each year, display the average duration of all the movies made in that year, order the results by avarage duration in descending order
SELECT release_year,
    COUNT(*) AS num_of_movies,
    ROUND(AVG(duration_in_minutes), 0) AS avg_duration
FROM movies
GROUP BY release_year
HAVING COUNT(*) > 1
ORDER BY avg_duration DESC;