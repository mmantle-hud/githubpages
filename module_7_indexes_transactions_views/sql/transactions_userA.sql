BEGIN;

-- User A selects seat 23E
SELECT
    *
FROM
    seats
WHERE
    seat_status = 'AVAILABLE' FOR
UPDATE
;

-- Step 2: Book the seat safely
UPDATE
    seats
SET
    seat_status = 'RESERVED'
WHERE
    seat_id = '23E';

INSERT INTO
    BOOKINGS (seat_id, user_id)
VALUES
    ('23E', 1);

-- COMMIT;