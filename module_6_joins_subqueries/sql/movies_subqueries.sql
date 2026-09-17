-- Single row with a single column, a scalar subquery
-- Titles of movies that are shorted than the average length of all movies in the database
SELECT title,
    duration_in_minutes
FROM movies
WHERE movies.duration_in_minutes < (
        SELECT AVG(duration_in_minutes)
        FROM movies
    );
-- Get the genres of the most highly rated movie
-- SELECT genres.genre_name FROM genres
-- JOIN genre_movie ON genres.genre_id = genre_movie.genre_id
-- WHERE genre_movie.movie_id = (
--         SELECT movie_id FROM reviews
--         GROUP BY movie_id
--         ORDER BY AVG(rating) DESC LIMIT 1
-- );
-- What about ties?
-- This can be done as a join
SELECT g.genre_name
FROM genres g
    JOIN genre_movie gm ON g.genre_id = gm.genre_id
    JOIN movies m ON gm.movie_id = m.movie_id
    JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY g.genre_name,
    m.movie_id
ORDER BY AVG(r.rating) DESC
LIMIT 1;
-- But we only get one row.
-- SELECT movie_id, AVG(rating) AS averge_rating FROM reviews
-- GROUP BY movie_id
-- Same query written as a CTE
-- Step 1: Calculate the top-rated movie ID in an isolated block
WITH top_rated_movie AS (
    SELECT movie_id
    FROM reviews
    GROUP BY movie_id
    ORDER BY AVG(rating) DESC
    LIMIT 1
) -- -- Step 2: Grab the genres matching that specific isolated movie ID
SELECT genre_name
FROM genres
    JOIN genre_movie ON genres.genre_id = genre_movie.genre_id
    JOIN top_rated_movie ON genre_movie.movie_id = top_rated_movie.movie_id;
-- A list of all the movies that have been watched by the most active user
-- SELECT movies.title FROM movies
-- JOIN viewings ON movies.movie_id = viewings.movie_id
-- WHERE viewings.user_id = (
--     SELECT user_id FROM viewings 
--     GROUP BY user_id
--     ORDER BY  COUNT(*)  DESC LIMIT 1
-- );
-- Multiple-Row, Single-Column Subqueries
-- IN and NOT IN
-- Find movies of the same genre as Inception
-- THE RECOMMENDATION ENGINE SUBQUERY
-- SELECT title FROM movies
-- JOIN genre_movie 
-- ON movies.movie_id = genre_movie.movie_id 
-- WHERE genre_movie.genre_id IN (
--         SELECT genre_id 
--         FROM genre_movie 
--         WHERE genre_movie.movie_id = 1
-- ) AND movies.movie_id != 1; -- Exclude Inception itself from the recommendations
-- Same query Using a CTE
-- WITH inception_genres AS (SELECT genre_id FROM genre_movie WHERE genre_movie.movie_id = 1)
-- SELECT title FROM movies
-- JOIN genre_movie 
-- ON movies.movie_id = genre_movie.movie_id 
-- JOIN inception_genres
-- ON genre_movie.genre_id = inception_genres.genre_id;
-- Movies that have never been watched
-- SELECT movie_id, title 
-- FROM movies 
-- WHERE movie_id NOT IN (
--     SELECT DISTINCT movie_id 
--     FROM viewings 
--     WHERE movie_id IS NOT NULL 
-- )
-- The IS NOT NULL is really important as it protects the query from failing
-- Same query as a CTE
-- WITH watched_movies AS (SELECT DISTINCT movie_id FROM viewings WHERE movie_id IS NOT NULL)
-- SELECT * FROM watched_movies
-- SELECT movie_id, title FROM movies WHERE movie_id NOT IN
-- SELECT movie_id, title 
-- FROM movies 
-- WHERE movie_id NOT IN (SELECT movie_id FROM watched_movies)
-- Correlated subqueries
-- SELECT email_address FROM users
-- WHERE 3 = (
--     SELECT COUNT(*) FROM reviews WHERE users.user_id = reviews.user_id
-- );
-- This can be written using a simple join and a HAVING caluse
-- This one can't
-- SELECT m1.title, m1.language_code, m1.duration_in_minutes
-- FROM movies m1
-- WHERE m1.duration_in_minutes > (
--     -- This inner query calculates a unique average for EACH language group
--     SELECT AVG(m2.duration_in_minutes) 
--     FROM movies m2 
--     WHERE m2.language_code = m1.language_code
-- );
-- users that have given a movie a higher rating than the average
-- SELECT r1.user_id, r1.movie_id, r1.rating
-- FROM reviews r1
-- WHERE r1.rating > (
--     -- Calculates the specific average for the movie currently being looked at
--     SELECT AVG(r2.rating) 
--     FROM reviews r2 
--     WHERE r2.movie_id = r1.movie_id
-- );
-- SELECT email_address FROM users
-- WHERE EXISTS (SELECT 1 FROM viewings WHERE 
--  viewings.user_id = users.user_id AND
-- watched_at::DATE = '2026-06-02');