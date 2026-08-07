TRUNCATE TABLE movies RESTART IDENTITY;
INSERT INTO movies (title, release_year, duration_in_minutes)
VALUES('Casablanca', 1943, 102);
INSERT INTO movies (title, release_year, duration_in_minutes)
VALUES ('Moonlight', 2016, 111),
    ('Winter''s Bone', 2010, 100),
    --wrong year for Spirited Away, fix with update later
    ('Spirited Away', 2000, 125),
    ('RRR', 2022, 187),
    ('Crouching Tiger, Hidden Dragon', 2000, 120),
    ('Another Round', 2020, 117);