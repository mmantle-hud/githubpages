
-- 1) Find all the flights that have no aircraft assigned.
SELECT
    flight_id,
    origin_name,
    destination_name,
    departure
FROM flight_details
WHERE tail_number IS NULL
ORDER BY departure;

-- 2) Find all the flights that departed after the 14th of July 2026.
SELECT
    flight_id,
    origin_name,
    destination_name,
    departure
FROM flight_details
WHERE departure > '2026-07-14 00:00:00+01';

-- 3) Find how many flights each aircraft is flying
SELECT
    tail_number,
    COUNT(*) as num_flights
FROM flight_details
WHERE tail_number IS NOT NULL
GROUP BY tail_number;

-- 4) Find the number of flights on each route.  
SELECT
    origin_name,
    destination_name,
    COUNT(*) AS flight_count
FROM flight_details
GROUP BY route_id, origin_name, destination_name
ORDER BY flight_count DESC;