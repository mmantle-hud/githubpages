# Lab Subqueries

## Warming up

Make sure you use subqueries, many of these question can be answered using a join.

## Scalar Subqueries
Find all flights that cost more than the average flight price.

```sql
SELECT 
    flight_id, 
    route_id, 
    base_price
FROM flights
WHERE base_price > (SELECT AVG(base_price) FROM flights);

```

Find the details of the aircraft model that has the highest seating capacity.

```sql
SELECT 
    manufacturer, 
    model_name, 
    seat_capacity
FROM aircraft_models
WHERE seat_capacity = (SELECT MAX(seat_capacity) FROM aircraft_models);
```

## Multiple row, Single Value Queries

Find all aircraft models that have never actually been assigned to a physical aircraft in the fleet.

```sql
SELECT manufacturer, model_name
FROM aircraft_models
WHERE model_id NOT IN (
    SELECT DISTINCT model_id 
    FROM aircraft
);
```

Find any scheduled flights that are flying from London Heathrow Airport.


```sql
SELECT flight_id, route_id, departure
FROM flights
WHERE route_id IN (
    -- Multi-column, single-row subquery
    SELECT route_id
    FROM routes
    WHERE routes.origin_airport = 'LHR'
);
```
## dervied tables

Find the average number of flights per route

```sql
SELECT AVG(route_tallies.total_flights) AS average_flights_per_route
FROM (
    SELECT route_id, COUNT(flight_id) AS total_flights
    FROM flights
    GROUP BY route_id
) AS route_tallies;

```


## Correlated Subqueries

Find all flights that are cheaper than the average price for their specific route.

```sql
SELECT f1.flight_id, f1.route_id, f1.base_price
FROM flights f1
WHERE f1.base_price < (
    SELECT AVG(f2.base_price)
    FROM flights f2
    WHERE f2.route_id = f1.route_id -- The correlation link
);

```
Contrast this with the simpler, non-correlated example you looked at earlier. A non-correlated subquery compares every flight to the global average (e.g., £300). This correlated version compares a London-to-New York flight only against other London-to-New York flights, and a short domestic flight only against domestic prices.

List all aircraft models, and show the total number of physical aircraft the airline owns for each model.

```sql
SELECT 
    am.manufacturer,
    am.model_name,
    (
        SELECT COUNT(*)
        FROM aircraft a
        WHERE a.model_id = am.model_id -- The correlation link
    ) AS total_owned
FROM aircraft_models am;

```



```mermaid
erDiagram
    routes }o--|| airports : ""
    routes }o--|| airports : ""
    flights }o--|| routes : ""
    flights }o--|| aircraft : ""
    aircraft }o--|| aircraft_models : ""
    
    airports {
        char(3) iata_code PK
        varchar(255) name
        varchar(100) city
        smallint number_runways
    }

    routes {
        int route_id PK
        char(3) origin_airport FK
        char(3) destination_airport FK
    }

    aircraft {
        varchar(10) tail_number PK
        int model_id FK
    }

    aircraft_models {
        int model_id PK
        varchar(255) manufacturer
        varchar(255) model_name
        int seat_capacity
    }

    flights {
        int flight_id PK
        int route_id FK
        varchar(10) tail_number FK
        timestamptz departure
        timestamptz arrival
        numeric base_price 
    }
```


```mermaid
erDiagram
    routes }o--|| airports : origin
    routes }o--|| airports : destination
    flights }o--|| routes : route
    flights }o--|| aircraft_instances : assigned_plane
    aircraft }o--|| aircraft_models : model
    flight_crew_assignments }o--|| flights : flight
    flight_crew_assignments }o--|| crew : crew_member

    airports {
        char(3) iata_code PK
        varchar(255) name
        smallint number_runways
    }

    routes {
        int route_id PK
        char(3) origin_airport FK
        char(3) destination_airport FK
        varchar(10) flight_number
    }

    aircraft_models {
        int model_id PK
        varchar(50) manufacturer
        varchar(50) model_name
        int seat_capacity
    }

    aircraft {
        varchar(10) tail_number PK
        int model_id FK
        varchar(20) status
    }

    flights {
        int flight_id PK
        int route_id FK
        varchar(10) tail_number FK
        timestamptz departure
        timestamptz arrival
    }

    crew {
        int crew_id PK
        varchar(100) first_name
        varchar(100) last_name
        varchar(30) job_title
    }

    flight_crew_assignments {
        int flight_id PK, FK
        int crew_id PK, FK
        varchar(30) assigned_role
    }
```