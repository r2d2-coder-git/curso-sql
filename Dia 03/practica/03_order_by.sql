-- =====================================================
-- PRÁCTICA: ORDER BY
-- =====================================================

-- Ordenar por precio ascendente (menor a mayor)
SELECT titulo, precio FROM videojuegos ORDER BY precio ASC;

-- Ordenar por precio descendente (mayor a menor)
SELECT titulo, precio FROM videojuegos ORDER BY precio DESC;

-- Ordenar por puntuación descendente
SELECT titulo, puntuacion FROM videojuegos ORDER BY puntuacion DESC;

-- Ordenar por múltiples columnas
SELECT titulo, genero, precio 
FROM videojuegos 
ORDER BY genero ASC, precio DESC;

-- Ordenar por fecha (más recientes primero)
SELECT titulo, fecha_lanzamiento 
FROM videojuegos 
ORDER BY fecha_lanzamiento DESC;

-- Ordenar por columna calculada
SELECT 
    titulo,
    precio,
    precio * 1.21 AS precio_con_iva
FROM videojuegos
ORDER BY precio_con_iva DESC;

-- Ordenar por posición de columna (no recomendado, pero válido)
SELECT titulo, precio, puntuacion 
FROM videojuegos 
ORDER BY 3 DESC;  -- Ordena por la tercera columna (puntuacion)

-- Ordenar con NULL al final
SELECT titulo, puntuacion 
FROM videojuegos 
ORDER BY puntuacion DESC NULLS LAST;

-- Ordenar alfabéticamente
SELECT titulo FROM videojuegos ORDER BY titulo ASC;

-- Ordenar de forma aleatoria
SELECT titulo FROM videojuegos ORDER BY RANDOM();
