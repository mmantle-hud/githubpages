TRUNCATE TABLE cities RESTART IDENTITY;

TRUNCATE TABLE countries RESTART IDENTITY CASCADE;

INSERT INTO
    countries (country_name, total_population, currency_code)
VALUES
    ('Germany', 84000000, 'EUR'),
    ('Spain', 48000000, 'EUR'),
    ('Japan', 125000000, 'JPY'),
    ('Canada', 40000000, 'CAD'),
    ('Morocco', 37000000, 'MAD');

INSERT INTO
    cities (
        city_name,
        is_capital,
        avg_temp_celsius,
        country_id
    )
VALUES
    ('Berlin', TRUE, 10.5, 1),
    ('Munich', false, 9.0, 1),
    ('Hamburg', false, 9.7, 1),
    ('Madrid', TRUE, 15.0, 2),
    ('Barcelona', false, 18.2, 2),
    ('Tokyo', TRUE, 16.5, 3);

SELECT
    countries.country_name,
    COUNT(cities.city_name) AS num_of_cities
FROM
    countries
    INNER JOIN cities ON countries.country_id = cities.country_id
GROUP BY
    countries.country_name;