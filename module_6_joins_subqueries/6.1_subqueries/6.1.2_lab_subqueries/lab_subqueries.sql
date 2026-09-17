
-- Scalar Subqueries
-- 1) Find all flights that cost more than the average flight price.
SELECT 
    flight_id, 
    route_id, 
    base_price
FROM flights
WHERE base_price > (SELECT AVG(base_price) FROM flights);
-- 2) Find the details of the aircraft model that has the highest seating capacity.
SELECT 
    manufacturer, 
    model_name, 
    seat_capacity
FROM aircraft_models
WHERE seat_capacity = (SELECT MAX(seat_capacity) FROM aircraft_models);

-- Multiple Rows, Single Value Subqueries
-- 3) Find all aircraft models that have never actually been assigned to a physical aircraft in the fleet.
SELECT manufacturer, model_name
FROM aircraft_models
WHERE model_id NOT IN (
    SELECT DISTINCT model_id 
    FROM aircraft
);
-- 4) Find any scheduled flights that are flying from London Heathrow Airport.
SELECT flight_id, route_id, departure
FROM flights
WHERE route_id IN (
    -- Multi-column, single-row subquery
    SELECT route_id
    FROM routes
    WHERE routes.origin_airport = 'LHR'
);

-- Table Subqueries in the `FROM` Clause (Derived Tables)
-- 5) Find the average number of flights per route
SELECT AVG(route_tallies.total_flights) AS average_flights_per_route
FROM (
    SELECT route_id, COUNT(*) AS total_flights
    FROM flights
    GROUP BY route_id
) AS route_tallies;

-- Correlated Subqueries
-- 6)Find all flights that are cheaper than the average price for their specific route.
SELECT f1.flight_id, f1.route_id, f1.base_price
FROM flights f1
WHERE f1.base_price < (
    SELECT AVG(f2.base_price)
    FROM flights f2
    WHERE f2.route_id = f1.route_id
);
-- 7) List all aircraft models, and show the total number of physical aircraft the airline owns for each model.
SELECT 
    am.manufacturer,
    am.model_name,
    (
        SELECT COUNT(*)
        FROM aircraft a
        WHERE a.model_id = am.model_id
    ) AS total_owned
FROM aircraft_models am;