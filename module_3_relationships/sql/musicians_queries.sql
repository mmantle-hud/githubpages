SELECT
    *
FROM
    musicians AS m
    INNER JOIN musician_instrument AS mi ON m.musician_id = mi.musician_id;

SELECT
    m.given_name,
    m.family_name,
    i.instrument_name
FROM
    musicians AS m
    INNER JOIN musician_instrument AS mi ON m.musician_id = mi.musician_id
    INNER JOIN instruments AS i ON mi.instrument_id = i.instrument_id;

SELECT
    m.given_name,
    m.family_name,
    i.instrument_name
FROM
    musicians AS m
    INNER JOIN musician_instrument AS mi ON m.musician_id = mi.musician_id
    INNER JOIN instruments AS i ON mi.instrument_id = i.instrument_id;

SELECT
    m.given_name,
    m.family_name,
    COUNT(mi.instrument_id) AS num_instruments
FROM
    musicians AS m
    INNER JOIN musician_instrument AS mi ON m.musician_id = mi.musician_id
GROUP BY
    m.given_name,
    m.family_name;

SELECT
    m.given_name,
    m.family_name,
    STRING_AGG(i.instrument_name, ', ') AS instruments
FROM
    musicians m
    INNER JOIN musician_instrument mi ON m.musician_id = mi.musician_id
    INNER JOIN instruments i ON mi.instrument_id = i.instrument_id
GROUP BY
    m.musician_id,
    m.given_name,
    m.family_name;