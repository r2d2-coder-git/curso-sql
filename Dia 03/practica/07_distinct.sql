-- =====================================================
-- PRÁCTICA: DISTINCT
-- =====================================================

-- Obtener géneros únicos
SELECT DISTINCT genero FROM videojuegos;

-- Obtener géneros únicos ordenados
SELECT DISTINCT genero FROM videojuegos ORDER BY genero;

-- Contar géneros únicos
SELECT COUNT(DISTINCT genero) AS total_generos FROM videojuegos;

-- DISTINCT con múltiples columnas
-- Devuelve combinaciones únicas de ambas columnas
SELECT DISTINCT genero, EXTRACT(YEAR FROM fecha_lanzamiento) AS año
FROM videojuegos
ORDER BY año DESC, genero;

-- Diferencia entre COUNT(*) y COUNT(DISTINCT)
SELECT 
    COUNT(*) AS total_registros,
    COUNT(DISTINCT genero) AS generos_unicos
FROM videojuegos;

-- DISTINCT en subconsultas
SELECT titulo, genero
FROM videojuegos
WHERE genero IN (
    SELECT DISTINCT genero 
    FROM videojuegos 
    WHERE precio > 50
);

-- Combinar DISTINCT con otras cláusulas
SELECT DISTINCT genero
FROM videojuegos
WHERE puntuacion >= 8.0
ORDER BY genero;

-- DISTINCT vs GROUP BY
-- Estas dos consultas dan el mismo resultado:
SELECT DISTINCT genero FROM videojuegos;
SELECT genero FROM videojuegos GROUP BY genero;

-- Pero GROUP BY permite funciones agregadas:
SELECT genero, COUNT(*) AS total
FROM videojuegos
GROUP BY genero;
