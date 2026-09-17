-- 1. DROP child/dependent tables first to avoid foreign key violations
DROP TABLE IF EXISTS flights;

DROP TABLE IF EXISTS aircraft;

DROP TABLE IF EXISTS routes;

-- 2. DROP independent master tables last
DROP TABLE IF EXISTS aircraft_models;

DROP TABLE IF EXISTS airports;

-- 3. Create independent master tables
CREATE TABLE airports (
    iata_code CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    number_runways SMALLINT NOT NULL,
    CONSTRAINT chk_airports_runways CHECK (number_runways >= 0)
);

CREATE TABLE aircraft_models (
    model_id INT PRIMARY KEY,
    manufacturer VARCHAR(255) NOT NULL,
    model_name VARCHAR(255) NOT NULL,
    seat_capacity INT NOT NULL,
    CONSTRAINT chk_models_capacity CHECK (seat_capacity > 0)
);

-- 4. Create tables with single-level dependencies
CREATE TABLE routes (
    route_id INT PRIMARY KEY,
    origin_airport CHAR(3) NOT NULL,
    destination_airport CHAR(3) NOT NULL,
    distance_km INT NOT NULL,
    -- Added distance column
    CONSTRAINT fk_routes_airports_origin FOREIGN KEY (origin_airport) REFERENCES airports(iata_code),
    CONSTRAINT fk_routes_airports_destination FOREIGN KEY (destination_airport) REFERENCES airports(iata_code),
    CONSTRAINT chk_routes_distinct_endpoints CHECK (origin_airport <> destination_airport),
    -- Check Constraint: Routes must have a valid positive distance
    CONSTRAINT chk_routes_positive_distance CHECK (distance_km > 0)
);

CREATE TABLE aircraft (
    tail_number VARCHAR(10) PRIMARY KEY,
    model_id INT NOT NULL,
    CONSTRAINT fk_aircraft_aircraft_models FOREIGN KEY (model_id) REFERENCES aircraft_models(model_id)
);

-- 5. Create the operational bridge table last
CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    route_id INT NOT NULL,
    tail_number VARCHAR(10),
    departure TIMESTAMPTZ NOT NULL,
    arrival TIMESTAMPTZ NOT NULL,
    base_price NUMERIC(10, 2),
    CONSTRAINT fk_flights_routes FOREIGN KEY (route_id) REFERENCES routes(route_id),
    CONSTRAINT fk_flights_aircraft FOREIGN KEY (tail_number) REFERENCES aircraft(tail_number),
    CONSTRAINT chk_flights_time_sequence CHECK (arrival > departure),
    CONSTRAINT chk_flights_positive_price CHECK (base_price >= 0.00)
);

WITH assignment_scores AS (
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
    s.given_name,
    s.family_name,
    COALESCE(os.overall_score, 0) AS final_score
FROM
    students AS s
    LEFT JOIN overall_scores AS os ON s.student_id = os.student_id
ORDER BY
    final_score DESC;