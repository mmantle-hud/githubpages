-- Drop child  tables 
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS viewings;
DROP TABLE IF EXISTS genre_movie;

-- Drop parent tables 
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS languages;


CREATE TABLE languages (
    language_code VARCHAR(2) NOT NULL,
    language_name VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT pk_languages PRIMARY KEY(language_code),
    CONSTRAINT chk_languages_language_code CHECK(length(language_code)=2)
);

CREATE TABLE users (
    user_id INT GENERATED ALWAYS AS IDENTITY,
    email_address VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (user_id)
);


CREATE TABLE movies (
    movie_id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    release_year SMALLINT NOT NULL,
    duration_in_minutes SMALLINT NOT NULL,
    language_code VARCHAR(2) NULL,
    CONSTRAINT pk_movies PRIMARY KEY (movie_id),
    CONSTRAINT fk_movies_languages FOREIGN KEY (language_code) REFERENCES languages (language_code),
    CONSTRAINT chk_movies_duration CHECK (duration_in_minutes > 0),
    CONSTRAINT chk_movies_release_year CHECK (release_year > 1888 AND release_year < 2100)
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

CREATE TABLE viewings(
    viewing_id INT GENERATED ALWAYS AS IDENTITY, 
    movie_id INT NOT NULL, 
    user_id INT NOT NULL, 
    watched_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    CONSTRAINT pk_viewings PRIMARY KEY (viewing_id), 
    CONSTRAINT fk_viewings_movies
    FOREIGN KEY (movie_id) REFERENCES movies (movie_id) ON DELETE CASCADE, 
    CONSTRAINT fk_viewings_users FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
);

CREATE TABLE reviews(
    review_id INT GENERATED ALWAYS AS IDENTITY, 
    movie_id INT NOT NULL, 
    user_id INT NOT NULL, 
    review_text TEXT NULL, 
    rating SMALLINT NOT NULL, 
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    
    CONSTRAINT pk_reviews PRIMARY KEY (review_id), 
    CONSTRAINT unique_user_movie_review UNIQUE (user_id, movie_id), 
    CONSTRAINT fk_reviews_movies FOREIGN KEY (movie_id) REFERENCES movies (movie_id) ON DELETE CASCADE, 
    CONSTRAINT fk_reviews_users FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
    
    CONSTRAINT chk_reviews_rating CHECK (rating BETWEEN 1 AND 5)
);