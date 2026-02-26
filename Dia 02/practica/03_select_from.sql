-- =====================================================
-- PRÁCTICA: Cómo seleccionamos datos con SQL
-- SELECT FROM
-- =====================================================

-- Seleccionar todos los datos de una tabla
SELECT * FROM platos;

-- Seleccionar columnas específicas
SELECT nombre, precio FROM platos;

-- Seleccionar con múltiples columnas
SELECT nombre, categoria, precio, disponible FROM platos;

-- Seleccionar con operaciones aritméticas
SELECT nombre, precio, precio * 1.21 AS precio_con_iva FROM platos;

-- Seleccionar con concatenación de texto
SELECT nombre || ' - ' || categoria AS descripcion_completa FROM platos;

-- Seleccionar valores únicos (sin duplicados)
SELECT DISTINCT categoria FROM platos;

-- Seleccionar con cálculos
SELECT 
    nombre,
    precio,
    ROUND(precio * 0.9, 2) AS precio_descuento_10
FROM platos;

-- Contar registros
SELECT COUNT(*) AS total_platos FROM platos;

-- Seleccionar con condiciones básicas
SELECT * FROM platos WHERE disponible = true;
SELECT nombre, precio FROM platos WHERE precio > 10;
