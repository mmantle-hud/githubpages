# Optional extra queries



## Trickier Questions

maybe re-write the previous queries using CTEs or JOINs. 


maybe they use any approach they like for the trickier questions. 


Make sure you use a subquery

List the airport codes of any origins that have a higher average route distance than the specific average distance of routes originating from John F. Kennedy Airport (JFK).
```sql
SELECT origin_airport, ROUND(AVG(distance_km), 2 ) AS avg_origin_distance
FROM routes
GROUP BY origin_airport
HAVING AVG(distance_km) > (
    SELECT AVG(distance_km) 
    FROM routes 
    WHERE origin_airport = 'JFK'
);

```
 
FH68 BPX


Find the average number of runways across all cities in your database, some cities have multiple airports so you will need to sum these first.

```sql
SELECT AVG(city_runways.total_runways) AS average_runways_per_city
FROM (
    SELECT city, SUM(number_runways) AS total_runways
    FROM airports
    GROUP BY city
) AS city_runways; -- The mandatory alias

```


Find all flights that are departing from London. The subquery will need to find the route IDs of all routes that depart from London. 

```sql
SELECT r.origin_airport, r.destination_airport, f.flight_id, f.departure, f.arrival, f.base_price
FROM flights AS f INNER JOIN routes AS r ON f.route_id = r.route_id
WHERE f.route_id IN (
    SELECT route_id 
    FROM routes INNER JOIN airports ON routes.origin_airport = airports.iata_code
    WHERE airports.city = 'London'
);

```

For every individual route, you want to display the flight_id and departure timestamp for the single most expensive flight on that route.

```sql
SELECT 
    f.route_id,
    f.flight_id,
    f.departure,
    peak_prices.max_price
FROM flights f
-- Step 1: Isolate the highest price per route inside the derived table
JOIN (
    SELECT route_id, MAX(base_price) AS max_price
    FROM flights
    GROUP BY route_id
) AS peak_prices 
  ON f.route_id = peak_prices.route_id 
 AND f.base_price = peak_prices.max_price;

```
