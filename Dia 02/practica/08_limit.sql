-- =====================================================
-- PRÁCTICA: Cómo limitamos los resultados
-- LIMIT
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Obtener solo los primeros 3 registros
SELECT * FROM dia02.platos LIMIT 3;

-- Obtener los 5 platos más baratos
SELECT nombre, precio FROM dia02.platos 
ORDER BY precio ASC 
LIMIT 5;

-- Obtener los 3 platos más caros
SELECT nombre, precio FROM dia02.platos 
ORDER BY precio DESC 
LIMIT 3;

-- LIMIT con OFFSET (saltar registros)
-- Obtener registros del 4 al 6
SELECT * FROM dia02.platos 
ORDER BY id_plato 
LIMIT 3 OFFSET 3;

-- Paginación: Primera página (registros 1-5)
SELECT * FROM dia02.platos 
ORDER BY nombre 
LIMIT 5 OFFSET 0;

-- Paginación: Segunda página (registros 6-10)
SELECT * FROM dia02.platos 
ORDER BY nombre 
LIMIT 5 OFFSET 5;

-- Fórmula para paginación:
-- LIMIT = tamaño_página
-- OFFSET = (número_página - 1) * tamaño_página

-- Obtener un registro aleatorio
SELECT * FROM dia02.platos 
ORDER BY RANDOM() 
LIMIT 1;

-- Top 3 platos disponibles más caros
SELECT nombre, precio FROM dia02.platos 
WHERE disponible = true 
ORDER BY precio DESC 
LIMIT 3;

-- ¿Por qué es importante LIMIT?
-- 1. Mejora el rendimiento al no cargar todos los datos
-- 2. Útil para pruebas y desarrollo
-- 3. Esencial para paginación en aplicaciones web
-- 4. Evita sobrecargar la memoria con grandes conjuntos de datos
