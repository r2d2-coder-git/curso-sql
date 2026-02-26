-- =====================================================
-- PRÁCTICA: HAVING
-- =====================================================

-- Géneros con más de 2 juegos
SELECT genero, COUNT(*) AS total_juegos
FROM videojuegos
GROUP BY genero
HAVING COUNT(*) > 2;

-- Géneros con precio promedio mayor a 55
SELECT 
    genero, 
    AVG(precio) AS precio_promedio
FROM videojuegos
GROUP BY genero
HAVING AVG(precio) > 55;

-- DIFERENCIA entre WHERE y HAVING:
-- WHERE filtra FILAS antes de agrupar
-- HAVING filtra GRUPOS después de agrupar

-- Ejemplo con WHERE (filtra filas individuales)
SELECT genero, COUNT(*) AS total
FROM videojuegos
WHERE precio > 50  -- Filtra juegos individuales con precio > 50
GROUP BY genero;

-- Ejemplo con HAVING (filtra grupos)
SELECT genero, COUNT(*) AS total
FROM videojuegos
GROUP BY genero
HAVING COUNT(*) > 1;  -- Filtra géneros que tienen más de 1 juego

-- Combinar WHERE y HAVING
SELECT 
    genero,
    COUNT(*) AS total,
    AVG(precio) AS precio_medio
FROM videojuegos
WHERE puntuacion >= 8.0  -- Primero: solo juegos con buena puntuación
GROUP BY genero
HAVING COUNT(*) >= 2;    -- Luego: solo géneros con al menos 2 juegos

-- HAVING con múltiples condiciones
SELECT genero, AVG(precio) AS precio_medio
FROM videojuegos
GROUP BY genero
HAVING AVG(precio) > 40 AND COUNT(*) >= 2;

-- HAVING con ORDER BY
SELECT genero, COUNT(*) AS total
FROM videojuegos
GROUP BY genero
HAVING COUNT(*) > 1
ORDER BY total DESC;
