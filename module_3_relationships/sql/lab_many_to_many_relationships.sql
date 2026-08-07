-- Display the movies and associated genres for all the movies in the database.
SELECT
    m.title,
    g.genre_name
FROM
    movies AS m
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id;

-- Display the genre names for the movie RRR
SELECT
    g.genre_name
FROM
    movies AS m
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
WHERE
    m.title = 'RRR';

-- Display the titles and year of release for all the comedy films
SELECT
    m.title,
    m.release_year
FROM
    movies AS m
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
WHERE
    g.genre_id = 8;

-- Display the number of films for each genre
SELECT
    g.genre_name,
    COUNT(*) AS num_movies
FROM
    movies AS m
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
GROUP BY
    g.genre_name;

-- Display the title of the movies that have been categorised under at least three genres
SELECT
    m.title,
    COUNT(g.genre_name) AS num_genres
FROM
    movies AS m
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
GROUP BY
    m.title
HAVING
    COUNT(g.genre_name) >= 3;

-- Display the title, year, language name and genres for Frozen
SELECT
    m.title,
    m.release_year,
    l.language_name,
    g.genre_name
FROM
    movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
WHERE
    m.title = 'Frozen';

-- Display the full details for all the movies title, year, duration, language name, genres. The results should have one row per movie (use STRING_AGG to construct a list of genres)
SELECT
    m.title,
    m.release_year,
    m.duration_in_minutes,
    l.language_name,
    STRING_AGG(g.genre_name, ', ') AS genres
FROM
    movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
GROUP BY
    m.title,
    m.release_year,
    m.duration_in_minutes,
    l.language_name;

-- Display all the Chinese films that are categorised as romance
-- | title                          | release_year | language_name | genre_name | 
-- |--------------------------------|--------------|---------------|------------| 
-- | Crouching Tiger, Hidden Dragon | 2000         | Chinese       | Romance    | 
-- | In the Mood for Love           | 2000         | Chinese       | Romance    | 
SELECT
    m.title,
    m.release_year,
    l.language_name,
    g.genre_name
FROM
    movies AS m
    INNER JOIN languages AS l ON m.primary_language = l.language_code
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
WHERE
    l.language_code = 'zh'
    AND g.genre_name = 'Romance';

-- Display the average duration of the films classified under each genre. Order this list by duration from longest to shortest.
SELECT
    g.genre_name,
    ROUND(AVG(m.duration_in_minutes), 0) AS average_duration
FROM
    movies AS m
    INNER JOIN genre_movie AS gm ON m.movie_id = gm.movie_id
    INNER JOIN genres AS g ON gm.genre_id = g.genre_id
GROUP BY
    g.genre_name;