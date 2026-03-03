-- =====================================================
-- PRÁCTICA: Cómo seleccionamos datos con SQL
-- SELECT FROM
-- =====================================================

-- Seleccionar todos los datos de una tabla
SELECT * FROM dia02.platos;
SELECT * FROM dia02.categorias;

-- Seleccionar columnas específicas
SELECT nombre, precio FROM dia02.platos;
SELECT nombre, descripcion FROM dia02.categorias;

-- Seleccionar con múltiples columnas
SELECT nombre, categoria, precio, disponible FROM dia02.platos;

-- Seleccionar con operaciones aritméticas
SELECT nombre, precio, precio * 1.21 AS precio_con_iva FROM dia02.platos;

-- Seleccionar con concatenación de texto
SELECT nombre || ' - ' || categoria AS descripcion_completa FROM dia02.platos;

-- Seleccionar valores únicos (sin duplicados)
SELECT DISTINCT categoria FROM dia02.platos;

-- Seleccionar con cálculos
SELECT 
    nombre,
    precio,
    ROUND(precio * 0.9, 2) AS precio_descuento_10
FROM dia02.platos;

-- Contar registros
SELECT COUNT(*) AS total_platos FROM dia02.platos;
SELECT COUNT(*) AS total_categorias FROM dia02.categorias;
