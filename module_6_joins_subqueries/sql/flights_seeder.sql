TRUNCATE TABLE flights,
routes;

TRUNCATE TABLE airports,
aircraft_models RESTART IDENTITY CASCADE;

INSERT INTO
    airports (iata_code, name, city, number_runways)
VALUES
    ('LHR', 'London Heathrow Airport', 'London', 2),
    ('LGW', 'London Gatwick Airport', 'London', 1),
    -- MULTIPLE AIRPORTS IN CITY
    (
        'JFK',
        'John F. Kennedy International Airport',
        'New York',
        4
    ),
    ('LGA', 'LaGuardia Airport', 'New York', 2),
    -- MULTIPLE AIRPORTS IN CITY
    ('CDG', 'Charles de Gaulle Airport', 'Paris', 4),
    ('EDI', 'Edinburgh Airport', 'Edinburgh', 1),
    ('DXB', 'Dubai International Airport', 'Dubai', 2);

INSERT INTO
    aircraft_models (
        model_id,
        manufacturer,
        model_name,
        seat_capacity
    )
VALUES
    (100, 'Boeing', '777-300ER', 396),
    (200, 'Airbus', 'A320neo', 180),
    (300, 'Embraer', 'E190', 100),
    (400, 'Airbus', 'A380-800', 525);

-- No physical aircraft exists for this model yet!
-- ============================================================================
-- 2. SEED DEPENDENT MASTER TABLES
-- ============================================================================
INSERT INTO
    routes (
        route_id,
        origin_airport,
        destination_airport,
        distance_km
    )
VALUES
    (1, 'LHR', 'JFK', 5540),
    -- Heathrow to JFK
    (2, 'JFK', 'LHR', 5540),
    -- JFK to Heathrow
    (3, 'LHR', 'CDG', 350),
    -- Heathrow to Paris
    (4, 'LHR', 'EDI', 530),
    -- Heathrow to Edinburgh
    (5, 'DXB', 'LHR', 5470),
    -- Dubai to Heathrow
    (6, 'EDI', 'CDG', 1100),
    -- This route has no flights scheduled at all!
    (7, 'LGW', 'LGA', 5570),
    -- Gatwick to LaGuardia (New airport pair!)
    (8, 'LGA', 'LGW', 5570);

-- LaGuardia to Gatwick (Has no flights scheduled!)
INSERT INTO
    aircraft (tail_number, model_id)
VALUES
    ('G-WSSS', 100),
    -- Boeing 777
    ('G-TTNA', 200),
    -- Airbus A320
    ('G-TTNB', 200),
    -- Airbus A320
    ('N101JF', 100),
    -- Boeing 777
    ('G-EMBR', 300);

-- This plane exists in the fleet but has 0 assigned flights!
-- ============================================================================
-- 3. SEED OPERATIONAL BRIDGE TABLE (FLIGHTS)
-- ============================================================================
INSERT INTO
    flights (
        flight_id,
        route_id,
        tail_number,
        departure,
        arrival,
        base_price
    )
VALUES
    -- Active Flights
    (
        1001,
        1,
        'G-WSSS',
        '2026-07-01 08:30:00+01',
        '2026-07-01 16:00:00+01',
        450.00
    ),
    (
        1002,
        2,
        'N101JF',
        '2026-07-01 20:00:00+01',
        '2026-07-02 03:30:00+01',
        520.00
    ),
    (
        1003,
        3,
        'G-TTNA',
        '2026-07-02 07:00:00+01',
        '2026-07-02 08:15:00+01',
        89.00
    ),
    (
        1004,
        4,
        'G-TTNB',
        '2026-07-02 09:00:00+01',
        '2026-07-02 10:30:00+01',
        65.00
    ),
    (
        1005,
        1,
        'G-WSSS',
        '2026-07-02 11:30:00+01',
        '2026-07-02 19:00:00+01',
        480.00
    ),
    (
        1006,
        5,
        'N101JF',
        '2026-07-15 04:00:00+01',
        '2026-07-15 11:45:00+01',
        NULL
    ),
    (
        1007,
        3,
        NULL,
        '2026-07-15 14:00:00+01',
        '2026-07-15 15:15:00+01',
        95.00
    ),
    (
        1008,
        4,
        NULL,
        '2026-07-16 18:00:00+01',
        '2026-07-16 19:30:00+01',
        NULL
    ),
    -- New Co-existing Airport Flight (Gatwick to LaGuardia)
    (
        1009,
        7,
        'G-TTNA',
        '2026-07-17 06:00:00+01',
        '2026-07-17 14:00:00+01',
        390.00
    );