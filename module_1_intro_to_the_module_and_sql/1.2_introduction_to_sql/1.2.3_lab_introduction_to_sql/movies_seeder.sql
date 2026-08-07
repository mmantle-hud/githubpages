TRUNCATE TABLE movies RESTART IDENTITY;
INSERT INTO movies (
        title,
        release_year,
        duration_in_minutes
    )
VALUES(
        'Casablanca',
        1943,
        102
    );
-- Add your own INSERT statements below