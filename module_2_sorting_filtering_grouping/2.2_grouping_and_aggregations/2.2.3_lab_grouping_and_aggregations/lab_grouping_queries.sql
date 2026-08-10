--     Display the total number of movies in the table
SELECT COUNT(*) AS total_num_movies
FROM movies;
--     Display the total duration of all the movies in the table
SELECT SUM(duration_in_minutes) AS total_duration
FROM movies;
--     Display the average duration (rounded to the nearest minute) of all the movies in the database.
SELECT ROUND(AVG(duration_in_minutes), 0) AS average_duration
FROM movies;
-- Display the shortes and longest movies in the database
SELECT MIN(duration_in_minutes),
    MAX(duration_in_minutes)
FROM movies;
--     Display the average duration (rounded to the nearest minute) of all the movies made in the 21st century
SELECT ROUND(AVG(duration_in_minutes), 0) AS average_duration
FROM movies
WHERE release_year >= 2000;
--     Display each year and the number of movies made in that year
SELECT release_year,
    COUNT(title) AS num_of_movies
FROM movies
GROUP BY release_year;
--     Display each year and the number of movies made in that year. Sort the results by the number of movies in descending order. 
SELECT release_year,
    COUNT(title) AS num_of_movies
FROM movies
GROUP BY release_year
ORDER BY num_of_movies DESC;
--     Display each year and the average duration (rounded to the nearest minute) of all the movies made in that year.
SELECT release_year,
    ROUND(AVG(duration_in_minutes), 0) AS avg_duration
FROM movies
GROUP BY release_year;
--      Display each year. For each year show the number of movies and the average duration (rounded to the nearest minute) for the  movies made in that year.
SELECT release_year,
    COUNT(*) AS num_of_movies,
    ROUND(AVG(duration_in_minutes), 0) AS avg_duration
FROM movies
GROUP BY release_year;
--     Display each year. For each year show the number of movies and the average duration (rounded to the nearest minute) for the movies made in that year. Filter the results so that only years where more than a single movie was released are shown. Order the results by average duration.
SELECT release_year,
    COUNT(*) AS num_of_movies,
    ROUND(AVG(duration_in_minutes), 0) AS avg_duration
FROM movies
GROUP BY release_year
HAVING COUNT(*) > 1
ORDER BY avg_duration DESC;
-- Display each year. For each year show the shortest, longest, and average movie duration.
SELECT release_year,
    MIN(duration_in_minutes) AS shortest_movie,
    MAX(duration_in_minutes) AS longest_movie,
    AVG(duration_in_minutes) AS average_duration
FROM movies
GROUP BY release_year
ORDER BY release_year;
-- Display the movie and title for all movies in the format title(release_year) e.g. Titanic (1997)
SELECT CONCAT(title, ' (', release_year, ')') AS title_and_year
FROM movies;
/*
 Could do creating tiers, but I'd need to go back to the notes/slides and add some examples.GROUP BY
 
 SELECT 
 CASE 
 WHEN duration_in_minutes < 100 THEN 'Short Feature (Under 1h 40m)'
 WHEN duration_in_minutes BETWEEN 100 AND 150 THEN 'Standard Runtime'
 ELSE 'Epic / Long Feature (Over 2h 30m)'
 END AS runtime_category,
 COUNT(*) AS total_count,
 ROUND((COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM movies) * 100), 1) || '%' AS percentage_of_collection
 FROM movies
 GROUP BY runtime_category
 ORDER BY total_count DESC;
 
 */