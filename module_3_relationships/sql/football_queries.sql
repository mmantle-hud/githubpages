SELECT
    *
FROM
    matches;

SELECT
    h.team_name AS home,
    a.team_name AS away,
    m.home_team_score AS home_score,
    m.away_team_score AS away_score,
    m.match_date AS date
FROM
    matches AS m
    INNER JOIN teams AS h ON m.home_team_id = h.team_id
    INNER JOIN teams AS a ON m.away_team_id = a.team_id;