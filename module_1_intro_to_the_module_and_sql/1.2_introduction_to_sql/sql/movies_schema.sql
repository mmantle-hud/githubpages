DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
    movie_id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    release_year SMALLINT NOT NULL,
    duration_in_minutes SMALLINT NOT NULL,
    CONSTRAINT pk_movies PRIMARY KEY (movie_id),
    CONSTRAINT chk_movies_duration CHECK (duration_in_minutes > 0),
    CONSTRAINT chk_movies_release_year CHECK (release_year > 1888)
);