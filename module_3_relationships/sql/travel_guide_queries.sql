SELECT
    cities.city_name,
    countries.country_name
FROM
    cities
    INNER JOIN countries ON cities.country_id = countries.country_id;

SELECT
    countries.country_name,
    COUNT(cities.city_name) AS num_of_cities
FROM
    countries
    INNER JOIN cities ON countries.country_id = cities.country_id
GROUP BY
    countries.country_name;

SELECT
    *
FROM
    cities
    INNER JOIN countries ON cities.country_id = countries.country_id;

SELECT
    c.city_name AS city,
    co.country_name AS country
FROM
    cities AS c
    INNER JOIN countries AS co ON c.country_id = co.country_id;