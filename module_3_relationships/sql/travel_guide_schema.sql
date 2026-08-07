DROP TABLE IF EXISTS cities;

DROP TABLE IF EXISTS countries;

CREATE TABLE countries (
  country_id INT GENERATED ALWAYS AS IDENTITY,
  country_name VARCHAR(255) NOT NULL,
  total_population BIGINT,
  currency_code CHAR(3),
  CONSTRAINT pk_countries PRIMARY KEY (country_id)
);

CREATE TABLE cities (
  city_id INT GENERATED ALWAYS AS IDENTITY,
  city_name VARCHAR(255) NOT NULL,
  is_capital BOOLEAN DEFAULT false,
  avg_temp_celsius NUMERIC(3, 1),
  country_id INT NOT NULL,
  CONSTRAINT pk_cities PRIMARY KEY (city_id),
  CONSTRAINT fk_cities_countries FOREIGN KEY (country_id) REFERENCES countries (country_id)
);