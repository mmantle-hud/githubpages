TRUNCATE TABLE musician_instrument RESTART IDENTITY;
TRUNCATE TABLE musicians RESTART IDENTITY   CASCADE;
TRUNCATE TABLE instruments RESTART IDENTITY   CASCADE;

INSERT INTO musicians (given_name, family_name) VALUES
('Alex', 'Mercer'),
('Elena', 'Rostova'),
('Marcus', 'Vance'),
('Chloe', 'Tanaka'),
('Zubair', 'Ali'); 

INSERT INTO instruments (instrument_name) VALUES
('Violin'),
('Drums'),
('Flute'),
('Keyboard');

INSERT INTO musician_instrument (musician_id, instrument_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 4),
(5, 1),
(5, 2),
(5, 4);


