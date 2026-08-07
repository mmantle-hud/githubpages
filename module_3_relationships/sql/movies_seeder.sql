TRUNCATE TABLE languages,
movies RESTART IDENTITY CASCADE;

TRUNCATE TABLE genres RESTART IDENTITY CASCADE;

INSERT INTO
    languages (language_code, language_name)
VALUES
    ('en', 'English'),
    ('ja', 'Japanese'),
    ('te', 'Telugu'),
    ('zh', 'Chinese'),
    ('da', 'Danish'),
    ('hi', 'Hindi'),
    ('es', 'Spanish'),
    ('fr', 'French'),
    ('ko', 'Korean');

INSERT INTO
    movies (
        title,
        release_year,
        duration_in_minutes,
        primary_language
    )
VALUES
    ('Casablanca', 1943, 102, 'en'),
    ('Moonlight', 2016, 111, 'en'),
    ('Winter''s Bone', 2010, 100, 'en'),
    ('Spirited Away', 2001, 125, 'ja'),
    ('RRR', 2022, 187, 'te'),
    (
        'Crouching Tiger, Hidden Dragon',
        2000,
        120,
        'zh'
    ),
    ('Another Round', 2020, 117, 'da'),
    ('Mean Girls', 2004, 97, 'en'),
    ('Yojimbo', 1961, 110, 'ja'),
    ('Titanic', 1997, 194, 'en'),
    ('Gone with the Wind', 1939, 238, 'en'),
    ('Avengers: Endgame', 2019, 181, 'en'),
    ('Sholay', 1975, 198, 'hi'),
    ('Ne Zha 2', 2025, 144, 'zh'),
    ('Instructions Not Included', 2013, 122, 'es'),
    ('Pan''s Labyrinth', 2006, 118, 'es'),
    ('The Secret in Their Eyes', 2009, 128, 'es'),
    ('Get Out', 2017, 104, 'en'),
    ('A Wrinkle in Time', 2018, 109, 'en'),
    ('Frozen', 2013, 102, 'en'),
    ('The Proposal', 2009, 108, 'en'),
    ('Lady Bird', 2017, 94, 'en'),
    ('Planet of the Apes', 1968, 112, 'en'),
    ('The Wizard of Oz', 1939, 102, 'en'),
    ('Shin Godzilla', 2016, 120, 'ja'),
    (
        'Jeanne Dielman, 23 quai du Commerce, 1080 Bruxelles',
        1975,
        201,
        'fr'
    ),
    ('Deewaar', 1975, 174, 'hi'),
    ('Fish Tank', 2009, 123, 'en'),
    ('Mudbound', 2017, 134, 'en'),
    ('Coco', 2017, 105, 'en'),
    ('Minari', 2020, 115, 'ko'),
    ('Beau Travail', 2000, 92, 'fr'),
    ('In the Mood for Love', 2000, 98, 'zh');

INSERT INTO
    genres (genre_name, genre_description)
VALUES
    (
        'Animation',
        'Films created using drawing, CGI, or stop-motion techniques.'
    ),
    (
        'Fantasy',
        'Elements of magic, mythology, folklore, or supernatural worlds.'
    ),
    (
        'Adventure',
        'Exciting stories focusing on journeys, exploration, or quests.'
    ),
    (
        'Action',
        'High-energy films featuring stunts, battles and chase sequences.'
    ),
    (
        'Drama',
        'Character-driven stories dealing with realistic themes.'
    ),
    (
        'Romance',
        'Stories focusing on romantic relationships and love.'
    ),
    (
        'Mystery',
        'Plots revolving around solving a crime, puzzle, or secret.'
    ),
    (
        'Comedy',
        'Comedy is a story that tells about a series of funny or comical events, intended to make the audience laugh.'
    ),
    (
        'Science Fiction',
        'Stories based in a future world that focus on advances in technology and science.'
    );

INSERT INTO
    genre_movie (genre_id, movie_id)
VALUES
    (5, 1),
    -- Casablanca (Drama)
    (6, 1),
    -- Casablanca (Romance)
    (5, 2),
    -- Moonlight (Drama)
    (5, 3),
    -- Winter's Bone (Drama)
    (7, 3),
    -- Winter's Bone (Mystery)
    (1, 4),
    -- Spirited Away (Animation)
    (2, 4),
    -- Spirited Away (Fantasy)
    (3, 4),
    -- Spirited Away (Adventure)
    (3, 5),
    -- RRR (Adventure)
    (4, 5),
    -- RRR (Action)
    (5, 5),
    -- RRR (Drama)
    (3, 6),
    -- Crouching Tiger, Hidden Dragon (Adventure)
    (4, 6),
    -- Crouching Tiger, Hidden Dragon (Action)
    (5, 6),
    -- Crouching Tiger, Hidden Dragon (Drama)
    (6, 6),
    -- Crouching Tiger, Hidden Dragon (Romance)
    (5, 7),
    (8, 7),
    -- Another Round (Drama)
    (5, 8),
    (8, 8),
    -- Mean Girls (Drama)
    (4, 9),
    -- Yojimbo (Action)
    (5, 9),
    -- Yojimbo (Drama)
    (5, 10),
    -- Titanic (Drama)
    (6, 10),
    -- Titanic (Romance)
    (5, 11),
    -- Gone with the Wind (Drama)
    (6, 11),
    -- Gone with the Wind (Romance)
    (3, 12),
    -- Avengers: Endgame (Adventure)
    (4, 12),
    -- Avengers: Endgame (Action)
    (2, 12),
    -- Avengers: Endgame (Fantasy)
    (3, 13),
    -- Sholay (Adventure)
    (4, 13),
    -- Sholay (Action)
    (5, 13),
    -- Sholay (Drama)
    (1, 14),
    -- Ne Zha 2 (Animation)
    (2, 14),
    -- Ne Zha 2 (Fantasy)
    (4, 14),
    -- Ne Zha 2 (Action)
    (5, 15),
    (8, 15),
    -- Instructions Not Included (Drama)
    (2, 16),
    -- Pan's Labyrinth (Fantasy)
    (5, 16),
    -- Pan's Labyrinth (Drama)
    (5, 17),
    -- The Secret in Their Eyes (Drama)
    (7, 17),
    -- The Secret in Their Eyes (Mystery)
    (5, 18),
    -- Get Out (Drama)
    (7, 18),
    -- Get Out (Mystery)
    (2, 19),
    -- A Wrinkle in Time (Fantasy)
    (3, 19),
    -- A Wrinkle in Time (Adventure)
    (1, 20),
    -- Frozen (Animation)
    (2, 20),
    -- Frozen (Fantasy)
    (3, 20),
    -- Frozen (Adventure)
    (5, 21),
    -- The Proposal (Drama)
    (6, 21),
    (8, 21),
    -- The Proposal (Romance)
    (5, 22),
    (8, 22),
    -- Lady Bird (Drama)
    (3, 23),
    -- Planet of the Apes (Adventure)
    (5, 23),
    -- Planet of the Apes (Drama)
    (2, 24),
    -- The Wizard of Oz (Fantasy)
    (3, 24),
    -- The Wizard of Oz (Adventure)
    (4, 25),
    -- Shin Godzilla (Action)
    (5, 25),
    -- Shin Godzilla (Drama)
    (5, 26),
    -- Jeanne Dielman... (Drama)
    (4, 27),
    -- Deewaar (Action)
    (5, 27),
    -- Deewaar (Drama)
    (5, 28),
    -- Fish Tank (Drama)
    (5, 29),
    -- Mudbound (Drama)
    (1, 30),
    -- Coco (Animation)
    (2, 30),
    -- Coco (Fantasy)
    (3, 30),
    -- Coco (Adventure)
    (5, 31),
    -- Minari (Drama)
    (5, 32),
    -- Beau Travail (Drama)
    (5, 33),
    -- In the Mood for Love (Drama)
    (6, 33);

-- In the Mood for Love (Romance)
-- INSERT INTO
--     genre_movie (movie_id, genre_id)
-- VALUES
--     (1, 5),
--     (1, 6),
--     (2, 5),
--     (3, 5),
--     (3, 7),
--     (4, 1),
--     (4, 2),
--     (4, 3),
--     (5, 3),
--     (5, 4),
--     (5, 5),
--     (6, 2),
--     (6, 3),
--     (6, 4);