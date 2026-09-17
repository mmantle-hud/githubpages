-- 1. Clear child / weak tables first
TRUNCATE TABLE reviews RESTART IDENTITY;
TRUNCATE TABLE viewings RESTART IDENTITY;
TRUNCATE TABLE genre_movie RESTART IDENTITY;
-- 2. Clear parent / strong tables last
TRUNCATE TABLE genres RESTART IDENTITY CASCADE;
TRUNCATE TABLE movies RESTART IDENTITY CASCADE;
TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE languages RESTART IDENTITY CASCADE;
-- ============================================================================
-- 1. POPULATE LOOKUP TABLES
-- ============================================================================
-- Languages
INSERT INTO languages (language_code, language_name)
VALUES ('en', 'English'),
    ('ja', 'Japanese'),
    ('hi', 'Hindi'),
    ('zh', 'Chinese'),
    ('da', 'Danish');
-- Scandinavia (Denmark)
-- Genres (Will automatically get genre_id: 1, 2, 3, 4)
INSERT INTO genres (genre_name, genre_description)
VALUES ('Drama', 'Character-driven stories.'),
    -- ID: 1
    ('Mystery', 'Suspenseful investigations.'),
    -- ID: 2
    ('Anime', 'Japanese animation style.'),
    -- ID: 3
    ('Action', 'High-energy and choreography.');
-- ID: 4
-- ============================================================================
-- 2. POPULATE CORE TABLES
-- ============================================================================
-- Users (Will automatically get user_id: 1, 2)
INSERT INTO users (email_address, PASSWORD)
VALUES ('student_a@school.edu', 'hashed_pass_1'),
    -- ID: 1
    ('student_b@school.edu', 'hashed_pass_2');
-- ID: 2
-- Movies (Will automatically get movie_id: 1, 2, 3, 4, 5, 6)
INSERT INTO movies (
        title,
        release_year,
        duration_in_minutes,
        primary_language
    )
VALUES ('Moonlight', 2016, 111, 'en'),
    -- ID: 1 (USA)
    ('Winter''s Bone', 2010, 100, 'en'),
    -- ID: 2 (USA - note the escaped single quote)
    ('Spirited Away', 2001, 125, 'ja'),
    -- ID: 3 (Japan)
    ('RRR', 2022, 187, 'hi'),
    -- ID: 4 (India - Action masterpiece)
    (
        'Crouching Tiger, Hidden Dragon',
        2000,
        120,
        'zh'
    ),
    -- ID: 5 (China - Wuxia classic)
    ('Another Round', 2020, 117, 'da');
-- ID: 6 (Scandinavia/Denmark - Oscar winner)
-- ============================================================================
-- 3. POPULATE LINK TABLES (Assuming IDs 1, 2, 3...)
-- ============================================================================
-- Many-to-Many Bridge Table (Linking Movies to Genres)
INSERT INTO genre_movie (movie_id, genre_id)
VALUES (1, 1),
    -- Moonlight (1) is a Drama (1)
    (2, 1),
    -- Winter's Bone (2) is a Drama (1)
    (2, 2),
    -- Winter's Bone (2) is a Mystery (2)
    (3, 3),
    -- Spirited Away (3) is Anime (3)
    (3, 1),
    -- Spirited Away (3) is a Drama (1)
    (4, 4),
    -- RRR (4) is Action (4)
    (5, 4),
    -- Crouching Tiger (5) is Action (4)
    (5, 1),
    -- Crouching Tiger (5) is a Drama (1)
    (6, 1);
-- Another Round (6) is a Drama (1)
-- Viewings Log Table (Who watched what)
INSERT INTO viewings (movie_id, user_id, watched_at)
VALUES (1, 1, '2026-06-01 18:00:00+00'),
    -- Student A (1) watched Moonlight (1)
    (4, 1, '2026-06-01 20:00:00+00'),
    -- Student A (1) watched RRR (4)
    (3, 2, '2026-06-02 14:30:00+00'),
    -- Student B (2) watched Spirited Away (3)
    (6, 2, '2026-06-02 16:45:00+00'),
    -- Student B (2) watched Another Round (6)
    (5, 2, '2026-05-02 16:45:00+00');
-- Student B (2) watched Another Round (6)
-- Reviews Table (Who rated what)
INSERT INTO reviews (
        movie_id,
        user_id,
        review_text,
        rating,
        created_at
    )
VALUES (
        1,
        1,
        'Beautiful cinematography and acting.',
        5,
        '2026-06-01 19:55:00+00'
    ),
    (
        4,
        1,
        'Absolutely wild action scenes! Loved it.',
        2,
        '2026-06-01 23:15:00+00'
    ),
    (
        4,
        2,
        'A timeless masterpiece.',
        5,
        '2026-06-02 16:40:00+00'
    ),
    (
        6,
        2,
        'Great concept and bitter-sweet ending.',
        4,
        '2026-06-02 18:50:00+00'
    ),
    (
        2,
        2,
        'Great concept and bitter-sweet ending.',
        5,
        '2026-06-02 18:50:00+00'
    );