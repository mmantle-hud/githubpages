TRUNCATE TABLE teams,
matches RESTART IDENTITY CASCADE;

INSERT INTO
    teams (team_name)
VALUES
    ('Real Madrid'),
    ('Manchester City'),
    ('Barcelona'),
    ('Paris Saint-Germain'),
    ('Liverpool'),
    ('Roma'),
    ('Tottenham Hotspur'),
    ('Ajax'),
    ('Monaco'),
    ('Borussia Dortmund'),
    ('Malaga'),
    ('Bayern Munich');

INSERT INTO
    matches (
        match_date,
        home_team_id,
        away_team_id,
        home_team_score,
        away_team_score
    )
VALUES
    (
        '2017-03-08 20:45:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Barcelona'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Paris Saint-Germain'
        ),
        6,
        1
    ),
    (
        '2019-05-07 21:00:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Liverpool'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Barcelona'
        ),
        4,
        0
    ),
    (
        '2022-05-04 21:00:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Real Madrid'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Manchester City'
        ),
        3,
        1
    ),
    (
        '2018-04-10 20:45:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Roma'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Barcelona'
        ),
        3,
        0
    ),
    (
        '2019-04-17 21:00:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Manchester City'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Tottenham Hotspur'
        ),
        4,
        3
    ),
    (
        '2018-03-05 21:00:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Real Madrid'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Ajax'
        ),
        1,
        4
    ),
    (
        '2017-02-21 20:45:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Manchester City'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Monaco'
        ),
        5,
        3
    ),
    (
        '2013-04-09 20:45:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Borussia Dortmund'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Malaga'
        ),
        3,
        2
    ),
    (
        '2022-04-26 21:00:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Manchester City'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Real Madrid'
        ),
        4,
        3
    ),
    (
        '2026-04-28 21:00:00',
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Paris Saint-Germain'
        ),
        (
            SELECT
                team_id
            FROM
                teams
            WHERE
                team_name = 'Bayern Munich'
        ),
        5,
        4
    );