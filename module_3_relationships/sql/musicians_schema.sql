
DROP TABLE IF EXISTS musician_instrument;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS instruments;

CREATE TABLE musicians(
    musician_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255) NOT NULL,
    family_name VARCHAR(255) NULL,
    CONSTRAINT pk_musicians PRIMARY KEY (musician_id)
);
CREATE TABLE instruments(
    instrument_id INT GENERATED ALWAYS AS IDENTITY,
    instrument_name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_instruments PRIMARY KEY (instrument_id)
);
CREATE TABLE musician_instrument(
    musician_id INT,
    instrument_id INT,
    CONSTRAINT pk_musician_instrument PRIMARY KEY (musician_id,instrument_id),
    CONSTRAINT fk_musician_instrument_musicians FOREIGN KEY (musician_id) REFERENCES musicians(musician_id) ON DELETE CASCADE,
    CONSTRAINT fk_musician_instrument_instruments FOREIGN KEY (instrument_id) REFERENCES instruments(instrument_id) ON DELETE CASCADE
);