-- CTES
WITH best_scores AS (
    SELECT
        student_id,
        MAX(score) AS max_score
    FROM
        student_assessment_scores
    GROUP BY
        student_id
)
SELECT
    s.given_name,
    s.family_name,
    bs.max_score
FROM
    students AS s
    INNER JOIN best_scores AS bs ON s.student_id = bs.student_id;

-- CTES not good for scalar subqueries

-- Multiple Rows, Single Value Subqueries
-- 3) Find all aircraft models that have never actually been assigned to a physical aircraft in the fleet.

--subquery
SELECT manufacturer, model_name
FROM aircraft_models
WHERE model_id NOT IN (
    SELECT DISTINCT model_id 
    FROM aircraft
);

-- CTE
WITH active_models AS (
    SELECT DISTINCT model_id 
    FROM aircraft
)
SELECT manufacturer, model_name
FROM aircraft_models
LEFT JOIN active_models ON aircraft_models.model_id = active_models.model_id
WHERE active_models.model_id IS NULL;

-- 4) Find any scheduled flights that are flying from London Heathrow Airport.
-- subquery
SELECT flight_id, route_id, departure
FROM flights
WHERE route_id IN (
    -- Multi-column, single-row subquery
    SELECT route_id
    FROM routes
    WHERE routes.origin_airport = 'LHR'
);
-- cte
WITH lhr_routes AS (
    SELECT route_id
    FROM routes
    WHERE routes.origin_airport = 'LHR'
)
SELECT flights.flight_id, flights.route_id, flights.departure
FROM flights INNER JOIN lhr_routes ON flights.route_id = lhr_routes.route_id;


-- Table Subqueries in the `FROM` Clause (Derived Tables)
-- 5) Find the average number of flights per route
-- subquery
SELECT AVG(route_tallies.total_flights) AS average_flights_per_route
FROM (
    SELECT route_id, COUNT(*) AS total_flights
    FROM flights
    GROUP BY route_id
) AS route_tallies;
--cte
WITH route_tallies AS (
    SELECT route_id, COUNT(*) AS total_flights
    FROM flights
    GROUP BY route_id
) 
SELECT AVG(route_tallies.total_flights) AS average_flights_per_route FROM route_tallies;

-- Correlated Subqueries
-- 6)Find all flights that are cheaper than the average price for their specific route.
-- subquery
SELECT f1.flight_id, f1.route_id, f1.base_price
FROM flights AS f1
WHERE f1.base_price < (
    SELECT AVG(f2.base_price)
    FROM flights AS f2
    WHERE f2.route_id = f1.route_id
);
--cte
-- SELECT flight_id, route_id, base_price FROM flights ORDER BY route_id;

-- SELECT flights.route_id, AVG(flights.base_price) AS avg_price 
--     FROM flights
--     GROUP BY flights.route_id;

WITH avg_route_prices AS (
    SELECT flights.route_id, AVG(flights.base_price) AS avg_price 
    FROM flights
    GROUP BY flights.route_id
)
SELECT f.flight_id, f.route_id, f.base_price
FROM flights AS f
INNER JOIN avg_route_prices AS arp ON f.route_id = arp.route_id
WHERE f.base_price < arp.avg_price;

-- 7) List all aircraft models, and show the total number of physical aircraft the airline owns for each model.
--subquery
SELECT 
    am.manufacturer,
    am.model_name,
    (
        SELECT COUNT(*) 
        FROM aircraft a
        WHERE a.model_id  = am.model_id
    ) AS total_owned
FROM aircraft_models am;

-- CTE
WITH aircraft_owned_by_airline AS (
    SELECT model_id, COUNT(*) AS model_count
    FROM aircraft
    GROUP BY model_id
)
SELECT am.manufacturer,
    am.model_name, COALESCE(aoba.model_count,0) AS model_count FROM aircraft_models as am
LEFT JOIN aircraft_owned_by_airline AS aoba ON am.model_id = aoba.model_id;