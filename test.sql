SELECT * FROM cities;

SELECT
     countries.country_name,
     COUNT(cities.city_id) as num_of_cities
FROM
    countries
    LEFT JOIN cities ON countries.country_id = cities.country_id
GROUP BY countries.country_name;

SELECT
    m.mechanism_name
FROM
    mechanisms as m
    LEFT JOIN board_game_mechanism as bgm ON m.mechanism_id = bgm.mechanism_id
WHERE bgm.mechanism_id IS NULL;

SELECT
    m.mechanism_name,
    bgm.mechanism_id,
    bgm.board_game_id
FROM
    board_game_mechanism as bgm
    RIGHT JOIN mechanisms as m ON bgm.mechanism_id=m.mechanism_id;
-- WHERE bgm.mechanism_id IS NULL;

SELECT
    m.mechanism_name
FROM
    board_game_mechanism as bgm
    RIGHT JOIN mechanisms as m ON bgm.mechanism_id=m.mechanism_id
WHERE bgm.mechanism_id IS NULL;

SELECT
    *
FROM
    board_game_mechanism as bgm
    RIGHT JOIN mechanisms as m ON bgm.mechanism_id=m.mechanism_id;
-- WHERE bgm.mechanism_id IS NULL;

SELECT * FROM mechanisms WHERE mechanisms.mechanism_id>=11;


SELECT 
    flight_id, 
    route_id, 
    base_price
FROM flights
WHERE base_price > (SELECT AVG(base_price) FROM flights);


SELECT AVG(base_price) FROM flights;

SELECT * FROM flights;


WITH 
assignment_scores AS (
    SELECT
        sas.student_id,
        a.assessment_id,
        ROUND(sas.score * a.assessment_weighting, 2) AS weighted_score
    FROM
        assessments AS a
        INNER JOIN student_assessment_scores AS sas ON a.assessment_id = sas.assessment_id
),
overall_scores AS (
    SELECT
        student_id,
        SUM(weighted_score) AS overall_score
    FROM
        assignment_scores
    GROUP BY
        student_id
)
SELECT
    s.student_id,
    s.given_name,
    s.family_name,
    os.overall_score AS final_score
FROM
    students AS s
    LEFT JOIN overall_scores AS os ON s.student_id = os.student_id
ORDER BY
    final_score DESC;

SELECT 
    a.iata_code,
    a.name,
    COUNT(f.flight_id) AS num_departing_flights
FROM airports AS a
LEFT JOIN routes AS r 
    ON a.iata_code = r.origin_airport
LEFT JOIN flights AS f 
    ON r.route_id = f.route_id
GROUP BY a.iata_code, a.name
ORDER BY num_departing_flights DESC;

SELECT 
    a.iata_code,
    a.name,
    COUNT(r.route_id) AS num_departing_flights
FROM airports AS a
LEFT JOIN routes AS r 
    ON a.iata_code = r.origin_airport
GROUP BY a.iata_code, a.name
ORDER BY num_departing_flights DESC;

SELECT 
    *
FROM airports AS a
LEFT JOIN routes AS r 
    ON a.iata_code = r.origin_airport;