-- =====================================================
-- PRÁCTICA: Orden lógico de las consultas SQL
-- =====================================================

/*
ORDEN DE ESCRITURA (cómo escribimos la consulta):
1. SELECT    - Qué columnas queremos
2. FROM      - De qué tabla(s)
3. WHERE     - Filtrar filas
4. GROUP BY  - Agrupar datos
5. HAVING    - Filtrar grupos
6. ORDER BY  - Ordenar resultados
7. LIMIT     - Limitar resultados

ORDEN DE EJECUCIÓN (cómo PostgreSQL procesa la consulta):
1. FROM      - Identifica la(s) tabla(s)
2. WHERE     - Filtra las filas
3. GROUP BY  - Agrupa los datos
4. HAVING    - Filtra los grupos
5. SELECT    - Selecciona las columnas
6. ORDER BY  - Ordena los resultados
7. LIMIT     - Limita los resultados
*/

-- Ejemplo completo mostrando el orden de escritura
SELECT 
    genero,                           -- 5. Seleccionar columnas
    COUNT(*) AS total_juegos,
    AVG(puntuacion) AS puntuacion_media
FROM dia03.videojuegos                -- 1. De qué tabla
WHERE precio < 70.00                  -- 2. Filtrar filas
GROUP BY genero                       -- 3. Agrupar datos
HAVING COUNT(*) > 1                   -- 4. Filtrar grupos
ORDER BY puntuacion_media DESC        -- 6. Ordenar resultados
LIMIT 3;                              -- 7. Limitar resultados

-- Ejemplo simple
SELECT titulo, puntuacion             -- 3. Seleccionar
FROM dia03.videojuegos                -- 1. De dónde
WHERE precio < 60.00                  -- 2. Filtrar
ORDER BY puntuacion DESC              -- 4. Ordenar
LIMIT 5;                              -- 5. Limitar

-- 1. No puedes usar alias de SELECT en WHERE
-- INCORRECTO:
-- SELECT titulo, precio * 1.21 AS precio_iva
-- FROM dia03.videojuegos
-- WHERE precio_iva > 50;  -- ERROR: precio_iva no existe aún

-- CORRECTO:
SELECT titulo, precio * 1.21 AS precio_iva
FROM dia03.videojuegos
WHERE precio * 1.21 > 50;

-- 2. Puedes usar alias de SELECT en ORDER BY
SELECT titulo, precio * 1.21 AS precio_iva
FROM dia03.videojuegos
ORDER BY precio_iva DESC;

-- 3. WHERE se ejecuta antes que GROUP BY
-- Filtra filas individuales antes de agrupar
SELECT genero, COUNT(*) AS total
FROM dia03.videojuegos
WHERE puntuacion > 8.0        -- Filtra juegos individuales
GROUP BY genero;

-- 4. HAVING se ejecuta después de GROUP BY
-- Filtra grupos ya formados
SELECT genero, COUNT(*) AS total
FROM dia03.videojuegos
GROUP BY genero
HAVING COUNT(*) > 1;          -- Filtra géneros con más de 1 juego

-- Ejemplo completo con todas las cláusulas
SELECT 
    genero,
    COUNT(*) AS cantidad,
    ROUND(AVG(precio), 2) AS precio_promedio,
    MAX(puntuacion) AS mejor_puntuacion
FROM dia03.videojuegos
WHERE fecha_lanzamiento >= '2020-01-01'   -- Primero: filtra por fecha
GROUP BY genero                            -- Segundo: agrupa por género
HAVING AVG(puntuacion) > 7.0              -- Tercero: solo géneros con buena puntuación
ORDER BY precio_promedio DESC             -- Cuarto: ordena por precio
LIMIT 5;                                  -- Quinto: muestra solo top 5
