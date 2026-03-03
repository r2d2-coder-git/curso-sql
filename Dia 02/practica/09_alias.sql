-- =====================================================
-- PRÁCTICA: Cómo renombramos columnas y tablas
-- ALIAS (AS)
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Alias para columnas con AS
SELECT 
    nombre AS plato,
    precio AS coste,
    categoria AS tipo
FROM dia02.platos;

-- Alias para columnas sin AS (también válido)
SELECT 
    nombre plato_del_dia,
    precio euros,
    disponible en_carta
FROM dia02.platos;

-- Alias con espacios (usar comillas dobles)
SELECT 
    nombre AS "Nombre del Plato",
    precio AS "Precio en €",
    categoria AS "Categoría"
FROM dia02.platos;

-- Alias para cálculos
SELECT 
    nombre,
    precio AS precio_original,
    precio * 1.21 AS precio_con_iva,
    precio * 0.9 AS precio_descuento
FROM dia02.platos;

-- Alias para concatenaciones
SELECT 
    nombre || ' (' || categoria || ')' AS descripcion_completa,
    precio AS precio_euros
FROM dia02.platos;

-- Alias para tablas
SELECT p.nombre, p.precio, p.categoria
FROM dia02.platos AS p
WHERE p.disponible = true;

-- Alias para tablas sin AS
SELECT p.nombre, p.precio
FROM dia02.platos p
WHERE p.precio > 10;

-- Alias con funciones agregadas
SELECT 
    categoria,
    COUNT(*) AS total_platos,
    AVG(precio) AS precio_promedio,
    MAX(precio) AS precio_maximo,
    MIN(precio) AS precio_minimo
FROM dia02.platos
GROUP BY categoria;

-- Buenas prácticas con alias:
-- 1. Usar nombres descriptivos y claros
-- 2. Usar alias para mejorar la legibilidad
-- 3. Usar alias cortos para tablas en consultas complejas
-- 4. Ser consistente en el estilo (con o sin AS)
