SELECT *
FROM movies;
-- Select the title and year of release
SELECT title,
    release_year
FROM movies;
-- Update
UPDATE movies
SET release_year = 2001
WHERE movie_id = 4;
-- Delete
DELETE FROM movies
WHERE movie_id = 3;
SELECT *
FROM movies;