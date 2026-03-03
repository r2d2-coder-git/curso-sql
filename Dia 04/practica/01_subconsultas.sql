-- =====================================================
-- PRÁCTICA: SUBCONSULTAS
-- =====================================================

-- Asegurarse de usar el esquema dia04

-- Crear tablas de ejemplo
CREATE TABLE IF NOT EXISTS artistas (
    id_artista SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    genero_principal VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS canciones (
    id_cancion SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_artista INTEGER,
    duracion_segundos INTEGER,
    reproducciones BIGINT,
    fecha_lanzamiento DATE,
    album VARCHAR(100)
);

-- Insertar datos
INSERT INTO artistas (nombre, pais, genero_principal) VALUES
    ('Rosalía', 'España', 'Flamenco Pop'),
    ('Bad Bunny', 'Puerto Rico', 'Reggaeton'),
    ('C. Tangana', 'España', 'Hip Hop'),
    ('Shakira', 'Colombia', 'Pop Latino');

INSERT INTO canciones (titulo, id_artista, duracion_segundos, reproducciones, fecha_lanzamiento, album) VALUES
    ('MALAMENTE', 1, 162, 450000000, '2018-05-30', 'El Mal Querer'),
    ('LA FAMA', 1, 212, 380000000, '2021-11-11', 'MOTOMAMI'),
    ('Tití Me Preguntó', 2, 244, 520000000, '2022-05-06', 'Un Verano Sin Ti'),
    ('Moscow Mule', 2, 264, 410000000, '2022-05-06', 'Un Verano Sin Ti');

-- Subconsulta en WHERE
-- Canciones con más reproducciones que el promedio
SELECT titulo, reproducciones
FROM canciones
WHERE reproducciones > (SELECT AVG(reproducciones) FROM canciones);

-- Subconsulta con IN
-- Artistas con canciones en el top 3
SELECT DISTINCT a.nombre
FROM artistas a
WHERE a.id_artista IN (
    SELECT id_artista 
    FROM canciones 
    ORDER BY reproducciones DESC 
    LIMIT 3
);

-- Subconsulta en SELECT
SELECT 
    titulo,
    reproducciones,
    (SELECT AVG(reproducciones) FROM canciones) AS promedio_general,
    reproducciones - (SELECT AVG(reproducciones) FROM canciones) AS diferencia
FROM canciones;

-- Subconsulta correlacionada
SELECT 
    a.nombre,
    (SELECT COUNT(*) FROM canciones c WHERE c.id_artista = a.id_artista) AS total_canciones
FROM artistas a;

-- Subconsulta en FROM
SELECT genero_principal, promedio_reproducciones
FROM (
    SELECT 
        a.genero_principal,
        AVG(c.reproducciones) AS promedio_reproducciones
    FROM artistas a
    JOIN canciones c ON a.id_artista = c.id_artista
    GROUP BY a.genero_principal
) AS stats
WHERE promedio_reproducciones > 400000000;
