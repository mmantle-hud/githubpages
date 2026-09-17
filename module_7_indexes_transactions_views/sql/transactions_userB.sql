-- BEGIN;
-- User B selects seat 23E, the seat is immediately locked
SELECT
    *
FROM
    seats
WHERE
    seat_status = 'AVAILABLE' FOR
UPDATE
;

;

-- -- Step 2: Book the seat safely
UPDATE
    seats
SET
    seat_status = 'RESERVED'
WHERE
    seat_id = '23E';

INSERT INTO
    BOOKINGS (seat_id, user_id)
VALUES
    ('23E', 2);

-- ;