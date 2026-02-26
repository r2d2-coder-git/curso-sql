-- =====================================================
-- PRÁCTICA: GROUP BY y COUNT
-- =====================================================

-- Contar juegos por género
SELECT genero, COUNT(*) AS cantidad_juegos
FROM videojuegos
GROUP BY genero;

-- Contar y calcular precio promedio por género
SELECT 
    genero, 
    COUNT(*) AS total_juegos,
    AVG(precio) AS precio_promedio
FROM videojuegos
GROUP BY genero;

-- ERROR TÍPICO: Intentar seleccionar columnas sin agrupar
-- Esto dará ERROR:
-- SELECT titulo, genero, COUNT(*) FROM videojuegos GROUP BY genero;
-- No puedes seleccionar 'titulo' porque no está en GROUP BY ni es una función agregada

-- CORRECTO: Solo columnas agrupadas o funciones agregadas
SELECT 
    genero,
    COUNT(*) AS total,
    AVG(precio) AS precio_medio,
    MAX(puntuacion) AS mejor_puntuacion
FROM videojuegos
GROUP BY genero;

-- Agrupar por múltiples columnas
SELECT 
    genero,
    EXTRACT(YEAR FROM fecha_lanzamiento) AS año,
    COUNT(*) AS total
FROM videojuegos
GROUP BY genero, EXTRACT(YEAR FROM fecha_lanzamiento);

-- Contar con condición
SELECT 
    genero,
    COUNT(*) AS total,
    COUNT(CASE WHEN precio > 50 THEN 1 END) AS juegos_caros
FROM videojuegos
GROUP BY genero;

-- Agrupar y ordenar
SELECT genero, COUNT(*) AS total
FROM videojuegos
GROUP BY genero
ORDER BY total DESC;
