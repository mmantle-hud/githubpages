DROP TABLE IF EXISTS bookings,
seats;

CREATE TABLE seats(
    seat_id VARCHAR(4) PRIMARY KEY,
    seat_status VARCHAR(255) NOT NULL
);

CREATE TABLE bookings(seat_id VARCHAR(4), user_id INT);

INSERT INTO
    seats (seat_id, seat_status)
VALUES
    ('21E', 'AVAILABLE'),
    ('22E', 'AVAILABLE'),
    ('23E', 'AVAILABLE'),
    ('24E', 'AVAILABLE');

SELECT
    *
FROM
    seats;

SELECT
    *
FROM
    bookings;

-- WHERE
--     seat_status = 'AVAILABLE';
-- BEGIN;
-- -- User A selects seat 23E, the seat is immediately locked
-- SELECT * FROM seats WHERE id = '23E' FOR UPDATE;
-- -- Step 2: Book the seat safely
-- UPDATE seats SET status = 'RESERVED', user = 'A' WHERE seat_id = '23E';
-- COMMIT;