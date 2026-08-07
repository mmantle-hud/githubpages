-- SELECT 
SELECT m.title,
    m.release_year,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code;
-- Display the title, year and language for all the movies released in 2020
SELECT m.title,
    m.release_year,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE release_year = 2020;
-- Display the title, year and language for all the movies released in 2010s. Order the results by year of release in ascending order.
SELECT m.title,
    m.release_year,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE release_year >= 2010
    AND release_year < 2020
ORDER BY release_year;
-- Display the title, year and language for all the movies released in 2010s where the primary language isn't English. Order the results by year of release in ascending order.
SELECT m.title,
    m.release_year,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE m.release_year >= 2010
    AND m.release_year < 2020
    AND l.language_code <> 'eng'
ORDER BY m.release_year ASC;
-- Display the title, year and language for all the movies that don't have English, Spanish or French as their primary language
SELECT m.title,
    m.release_year,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE l.language_code NOT IN ('eng', 'spa', 'fra');
-- Display the title and year for all the Hindi movies
SELECT m.title,
    m.release_year,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE l.language_code = 'hin';
-- Display the title and language name of all the movies where the title contains the substring 'Moo' and the primary language is English
SELECT m.title,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE m.title ILIKE '%Moo%'
    AND l.language_code = 'eng';
-- Display the title, duration and language name of all the movies that are at least three hours in length. Order the results by duration in descending order
SELECT m.title,
    m.duration_in_minutes,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE m.duration_in_minutes >= 180
ORDER BY m.duration_in_minutes DESC;
-- Display the number of movies produced in each language.
SELECT l.language_name,
    COUNT(m.title) AS num_movies
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
GROUP BY l.language_name;
-- Display the language names of all the languages that have exactly one movie in the database.
SELECT l.language_name,
    COUNT(m.title) AS num_movies
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
GROUP BY l.language_name
HAVING COUNT(m.title) = 1;
-- Display the title and duration of the shortest English language film
SELECT m.title,
    m.duration_in_minutes,
    l.language_name
FROM movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
WHERE l.language_code = 'eng'
ORDER BY m.duration_in_minutes ASC
LIMIT 1;
-- Display the total number of distinct languages present in the database.
SELECT COUNT(*) AS num_languages
FROM languages;