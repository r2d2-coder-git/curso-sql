-- =====================================================
-- PRÁCTICA: Cómo renombramos columnas y tablas
-- ALIAS (AS)
-- =====================================================

-- Alias para columnas con AS
SELECT 
    nombre AS plato,
    precio AS coste,
    categoria AS tipo
FROM platos;

-- Alias para columnas sin AS (también válido)
SELECT 
    nombre plato_del_dia,
    precio euros,
    disponible en_carta
FROM platos;

-- Alias con espacios (usar comillas dobles)
SELECT 
    nombre AS "Nombre del Plato",
    precio AS "Precio en €",
    categoria AS "Categoría"
FROM platos;

-- Alias para cálculos
SELECT 
    nombre,
    precio AS precio_original,
    precio * 1.21 AS precio_con_iva,
    precio * 0.9 AS precio_descuento
FROM platos;

-- Alias para concatenaciones
SELECT 
    nombre || ' (' || categoria || ')' AS descripcion_completa,
    precio AS precio_euros
FROM platos;

-- Alias para tablas
SELECT p.nombre, p.precio, p.categoria
FROM platos AS p
WHERE p.disponible = true;

-- Alias para tablas sin AS
SELECT p.nombre, p.precio
FROM platos p
WHERE p.precio > 10;

-- Alias útiles en JOINs (veremos más adelante)
SELECT 
    p.nombre AS plato,
    p.precio,
    c.nombre AS categoria_nombre
FROM platos p
JOIN categorias c ON p.categoria = c.nombre;

-- Alias con funciones agregadas
SELECT 
    categoria,
    COUNT(*) AS total_platos,
    AVG(precio) AS precio_promedio,
    MAX(precio) AS precio_maximo,
    MIN(precio) AS precio_minimo
FROM platos
GROUP BY categoria;

-- Buenas prácticas con alias:
-- 1. Usar nombres descriptivos y claros
-- 2. Usar alias para mejorar la legibilidad
-- 3. Usar alias cortos para tablas en consultas complejas
-- 4. Ser consistente en el estilo (con o sin AS)
