# Lab: Introduction to SQL

## CREATE (movies_schema.sql)
```sql
CREATE TABLE movies (
    movie_id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    release_year SMALLINT NOT NULL,
    duration_in_minutes SMALLINT NOT NULL,
    CONSTRAINT pk_movies PRIMARY KEY (movie_id)
);
```
## INSERT (movies_seeder.sql)
```sql
INSERT INTO movies (title, release_year, duration_in_minutes )
VALUES('Casablanca', 1943, 102);
INSERT INTO movies (title, release_year, duration_in_minutes)
VALUES ('Moonlight', 2016, 111),
    ('Winter''s Bone', 2010, 100),
    -- Wrong year for Spirited Away, fix with UPDATE later
    ('Spirited Away', 2000, 125),
    ('RRR', 2022, 187),
    ('Crouching Tiger, Hidden Dragon', 2000, 120),
    ('Another Round', 2020, 117);
```
## SELECT, UPDATE and DELETE (movies_queries.sql)
```sql
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
```

## Optional Extra
- Adding constraints to the ```CREATE``` statement in _movies_schema.sql_.
    - The duration of a movie must be a positive integer ```CHECK (duration_in_minutes > 0)```.
    - Cinema was invented in 1888. All years of release must be after 1888 ```CHECK (release_year > 1888)```. 
```sql
CREATE TABLE movies (
    movie_id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    release_year SMALLINT NOT NULL,
    duration_in_minutes SMALLINT NOT NULL,
    CONSTRAINT pk_movies PRIMARY KEY (movie_id),
    CONSTRAINT chk_movies_duration CHECK (duration_in_minutes > 0),
    CONSTRAINT chk_movies_release_year CHECK (release_year > 1888)
);
```
