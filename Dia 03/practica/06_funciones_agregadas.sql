-- =====================================================
-- PRÁCTICA: Funciones Agregadas
-- MAX, MIN, AVG, SUM, LENGTH
-- =====================================================

-- MAX: Valor máximo
SELECT MAX(precio) AS precio_maximo FROM videojuegos;
SELECT MAX(puntuacion) AS mejor_puntuacion FROM videojuegos;

-- MIN: Valor mínimo
SELECT MIN(precio) AS precio_minimo FROM videojuegos;
SELECT MIN(fecha_lanzamiento) AS juego_mas_antiguo FROM videojuegos;

-- AVG: Promedio
SELECT AVG(precio) AS precio_promedio FROM videojuegos;
SELECT ROUND(AVG(puntuacion), 2) AS puntuacion_media FROM videojuegos;

-- SUM: Suma total
SELECT SUM(precio) AS valor_total_inventario FROM videojuegos;

-- COUNT: Contar registros
SELECT COUNT(*) AS total_juegos FROM videojuegos;
SELECT COUNT(DISTINCT genero) AS total_generos FROM videojuegos;

-- LENGTH: Longitud de texto
SELECT titulo, LENGTH(titulo) AS longitud_titulo
FROM videojuegos
ORDER BY longitud_titulo DESC;

-- Combinar múltiples funciones
SELECT 
    COUNT(*) AS total_juegos,
    MAX(precio) AS precio_max,
    MIN(precio) AS precio_min,
    ROUND(AVG(precio), 2) AS precio_promedio,
    SUM(precio) AS valor_total
FROM videojuegos;

-- Funciones agregadas por grupo
SELECT 
    genero,
    COUNT(*) AS total,
    MAX(precio) AS mas_caro,
    MIN(precio) AS mas_barato,
    ROUND(AVG(precio), 2) AS promedio
FROM videojuegos
GROUP BY genero;

-- Encontrar el juego más caro
SELECT titulo, precio
FROM videojuegos
WHERE precio = (SELECT MAX(precio) FROM videojuegos);

-- Encontrar juegos con precio superior al promedio
SELECT titulo, precio
FROM videojuegos
WHERE precio > (SELECT AVG(precio) FROM videojuegos);
