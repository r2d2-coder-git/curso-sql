-- =====================================================
-- PRÁCTICA: ROW_NUMBER
-- =====================================================

-- Numerar todas las canciones por reproducciones
SELECT 
    ROW_NUMBER() OVER(ORDER BY reproducciones DESC) AS posicion,
    titulo,
    reproducciones
FROM canciones;

-- Numerar canciones por artista
SELECT 
    a.nombre AS artista,
    c.titulo,
    c.reproducciones,
    ROW_NUMBER() OVER(PARTITION BY c.id_artista ORDER BY c.reproducciones DESC) AS ranking_artista
FROM canciones c
JOIN artistas a ON c.id_artista = a.id_artista;

-- Obtener la canción más popular de cada artista
WITH ranking AS (
    SELECT 
        a.nombre AS artista,
        c.titulo,
        c.reproducciones,
        ROW_NUMBER() OVER(PARTITION BY c.id_artista ORDER BY c.reproducciones DESC) AS rn
    FROM canciones c
    JOIN artistas a ON c.id_artista = a.id_artista
)
SELECT artista, titulo, reproducciones
FROM ranking
WHERE rn = 1;

-- Paginación con ROW_NUMBER
WITH numeradas AS (
    SELECT 
        ROW_NUMBER() OVER(ORDER BY titulo) AS num_fila,
        titulo,
        reproducciones
    FROM canciones
)
SELECT titulo, reproducciones
FROM numeradas
WHERE num_fila BETWEEN 3 AND 5;

-- Eliminar duplicados con ROW_NUMBER
-- (útil cuando hay registros duplicados)
WITH duplicados AS (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY titulo ORDER BY id_cancion) AS rn
    FROM canciones
)
SELECT * FROM duplicados WHERE rn = 1;
