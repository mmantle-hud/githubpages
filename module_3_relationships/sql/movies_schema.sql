DROP TABLE IF EXISTS genre_movie;

DROP TABLE IF EXISTS movies;

DROP TABLE IF EXISTS genres;

DROP TABLE IF EXISTS languages;

CREATE TABLE languages (
    language_code CHAR(2) NOT NULL,
    language_name VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT pk_languages PRIMARY KEY(language_code)
);

CREATE TABLE movies (
    movie_id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    release_year SMALLINT NOT NULL,
    duration_in_minutes SMALLINT NOT NULL,
    primary_language CHAR(2) NOT NULL,
    CONSTRAINT pk_movies PRIMARY KEY (movie_id),
    CONSTRAINT fk_movies_languages FOREIGN KEY (primary_language) REFERENCES languages(language_code),
    CONSTRAINT chk_movies_duration CHECK (duration_in_minutes > 0),
    CONSTRAINT chk_movies_release_year CHECK (release_year > 1888)
);

CREATE TABLE genres (
    genre_id INT GENERATED ALWAYS AS IDENTITY,
    genre_name VARCHAR(100) UNIQUE NOT NULL,
    genre_description TEXT NULL,
    CONSTRAINT pk_genres PRIMARY KEY (genre_id)
);

CREATE TABLE genre_movie(
    genre_id INT NOT NULL,
    movie_id INT NOT NULL,
    CONSTRAINT pk_genre_movie PRIMARY KEY (movie_id, genre_id),
    CONSTRAINT fk_genre_movie_genres FOREIGN KEY (genre_id) REFERENCES genres (genre_id) ON DELETE CASCADE,
    CONSTRAINT fk_genre_movie_movies FOREIGN KEY (movie_id) REFERENCES movies (movie_id) ON DELETE CASCADE
);