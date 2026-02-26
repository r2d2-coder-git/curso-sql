INSERT INTO jugadores (id_jugador, nombre_jugador, nivel, experiencia, clan_id) VALUES
(1, 'Arthorius', 10, 2500, NULL),
(2, 'Elora', 12, 3000, NULL),
(3, 'Thorgar', 8, 1900, NULL),
(4, 'Lunaris', 14, 3400, NULL),
(5, 'Draxor', 9, 2200, NULL),
(6, 'Miryel', 7, 1800, NULL),
(7, 'Falcon', 15, 3600, NULL),
(8, 'Kelron', 13, 3200, NULL),
(9, 'Valyria', 10, 2500, NULL),
(10, 'Draven', 6, 1600, NULL),
(11, 'Leandra', 11, 2800, NULL),
(12, 'Zoltan', 12, 3000, NULL),
(13, 'Nyrith', 9, 2200, NULL),
(14, 'Korvin', 8, 2000, NULL),
(15, 'Althea', 10, 2600, NULL),
(16, 'Ragnar', 11, 2900, NULL),
(17, 'Tyrion', 7, 1700, NULL),
(18, 'Sylvan', 6, 1500, NULL),
(19, 'Maelis', 9, 2300, NULL),
(20, 'Fenris', 12, 3000, NULL),
(21, 'Orion', 14, 3400, NULL),
(22, 'Yliria', 8, 1900, NULL),
(23, 'Bran', 11, 2900, NULL),
(24, 'Seraphine', 13, 3200, NULL),
(25, 'Eldrin', 15, 3700, NULL),
(26, 'Haldor', 7, 1800, NULL),
(27, 'Talia', 10, 2600, NULL),
(28, 'Drystan', 9, 2200, NULL),
(29, 'Kyra', 8, 1900, NULL),
(30, 'Varyn', 12, 3000, NULL);


-- Asumiendo que los clanes han sido creados previamente
-- Actualiza el clan_id para cada jugador
UPDATE jugadores SET clan_id = 1 WHERE id_jugador = 1;  -- Arthorius
UPDATE jugadores SET clan_id = 2 WHERE id_jugador = 2;  -- Elora
UPDATE jugadores SET clan_id = 1 WHERE id_jugador = 3;  -- Thorgar
UPDATE jugadores SET clan_id = 3 WHERE id_jugador = 4;  -- Lunaris
UPDATE jugadores SET clan_id = 4 WHERE id_jugador = 5;  -- Draxor
UPDATE jugadores SET clan_id = 2 WHERE id_jugador = 6;  -- Miryel
UPDATE jugadores SET clan_id = 5 WHERE id_jugador = 7;  -- Falcon
UPDATE jugadores SET clan_id = 3 WHERE id_jugador = 8;  -- Kelron
UPDATE jugadores SET clan_id = 6 WHERE id_jugador = 9;  -- Valyria
UPDATE jugadores SET clan_id = 4 WHERE id_jugador = 10; -- Draven
UPDATE jugadores SET clan_id = 2 WHERE id_jugador = 11; -- Leandra
UPDATE jugadores SET clan_id = 1 WHERE id_jugador = 12; -- Zoltan
UPDATE jugadores SET clan_id = 5 WHERE id_jugador = 13; -- Nyrith
UPDATE jugadores SET clan_id = 3 WHERE id_jugador = 14; -- Korvin
UPDATE jugadores SET clan_id = 4 WHERE id_jugador = 15; -- Althea
UPDATE jugadores SET clan_id = 6 WHERE id_jugador = 16; -- Ragnar
UPDATE jugadores SET clan_id = 5 WHERE id_jugador = 17; -- Tyrion
UPDATE jugadores SET clan_id = 1 WHERE id_jugador = 18; -- Sylvan
UPDATE jugadores SET clan_id = 2 WHERE id_jugador = 19; -- Maelis
UPDATE jugadores SET clan_id = 3 WHERE id_jugador = 20; -- Fenris
UPDATE jugadores SET clan_id = 4 WHERE id_jugador = 21; -- Orion
UPDATE jugadores SET clan_id = 6 WHERE id_jugador = 22; -- Yliria
UPDATE jugadores SET clan_id = 5 WHERE id_jugador = 23; -- Bran
UPDATE jugadores SET clan_id = 2 WHERE id_jugador = 24; -- Seraphine
UPDATE jugadores SET clan_id = 1 WHERE id_jugador = 25; -- Eldrin
UPDATE jugadores SET clan_id = 3 WHERE id_jugador = 26; -- Haldor
UPDATE jugadores SET clan_id = 4 WHERE id_jugador = 27; -- Talia
UPDATE jugadores SET clan_id = 5 WHERE id_jugador = 28; -- Drystan
UPDATE jugadores SET clan_id = 6 WHERE id_jugador = 29; -- Kyra
UPDATE jugadores SET clan_id = 1 WHERE id_jugador = 30; -- Varyn
