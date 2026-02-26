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
    categoria,                    -- 5. Seleccionar columnas
    COUNT(*) AS total_platos,
    AVG(precio) AS precio_medio
FROM platos                       -- 1. De qué tabla
WHERE disponible = true           -- 2. Filtrar filas
GROUP BY categoria                -- 3. Agrupar datos
HAVING COUNT(*) > 1               -- 4. Filtrar grupos
ORDER BY precio_medio DESC        -- 6. Ordenar resultados
LIMIT 3;                          -- 7. Limitar resultados

-- Ejemplo simple
SELECT nombre, precio             -- 3. Seleccionar
FROM platos                       -- 1. De dónde
WHERE disponible = true           -- 2. Filtrar
ORDER BY precio DESC              -- 4. Ordenar
LIMIT 5;                          -- 5. Limitar

-- ¿Por qué es importante entender el orden de ejecución?

-- 1. No puedes usar alias de SELECT en WHERE
-- INCORRECTO:
-- SELECT nombre, precio * 1.21 AS precio_iva
-- FROM platos
-- WHERE precio_iva > 10;  -- ERROR: precio_iva no existe aún

-- CORRECTO:
SELECT nombre, precio * 1.21 AS precio_iva
FROM platos
WHERE precio * 1.21 > 10;

-- 2. Puedes usar alias de SELECT en ORDER BY
-- CORRECTO:
SELECT nombre, precio * 1.21 AS precio_iva
FROM platos
ORDER BY precio_iva DESC;  -- OK: SELECT ya se ejecutó

-- 3. WHERE se ejecuta antes que GROUP BY
-- Filtra filas individuales
SELECT categoria, COUNT(*) AS total
FROM platos
WHERE precio > 10  -- Filtra platos individuales
GROUP BY categoria;

-- 4. HAVING se ejecuta después de GROUP BY
-- Filtra grupos
SELECT categoria, COUNT(*) AS total
FROM platos
GROUP BY categoria
HAVING COUNT(*) > 2;  -- Filtra categorías con más de 2 platos

-- Ejemplo completo con explicación
SELECT 
    categoria,
    COUNT(*) AS cantidad,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM platos
WHERE disponible = true           -- Primero: filtra solo disponibles
GROUP BY categoria                -- Segundo: agrupa por categoría
HAVING AVG(precio) > 8            -- Tercero: solo categorías con promedio > 8
ORDER BY precio_promedio DESC     -- Cuarto: ordena por precio promedio
LIMIT 5;                          -- Quinto: muestra solo top 5
