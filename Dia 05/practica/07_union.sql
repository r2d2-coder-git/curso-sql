-- =====================================================
-- PRÁCTICA: UNION y UNION ALL
-- =====================================================

-- UNION: Combina resultados eliminando duplicados
SELECT nombre, 'Hotel' AS tipo FROM hoteles
UNION
SELECT nombre, 'Huésped' AS tipo FROM huespedes
ORDER BY nombre;

-- UNION ALL: Combina resultados manteniendo duplicados
SELECT nombre FROM hoteles
UNION ALL
SELECT nombre FROM huespedes;

-- Ejemplo práctico: Lista de contactos
SELECT 
    nombre AS contacto,
    email,
    'Huésped' AS categoria
FROM huespedes
UNION
SELECT 
    nombre AS contacto,
    email,
    'Gerente' AS categoria
FROM gerentes
ORDER BY categoria, contacto;

-- UNION con agregaciones
SELECT 
    'Total Hoteles' AS concepto,
    COUNT(*)::TEXT AS cantidad
FROM hoteles
UNION ALL
SELECT 
    'Total Huéspedes' AS concepto,
    COUNT(*)::TEXT AS cantidad
FROM huespedes
UNION ALL
SELECT 
    'Total Reservas' AS concepto,
    COUNT(*)::TEXT AS cantidad
FROM reservas;

-- UNION con filtros diferentes
SELECT nombre, ciudad FROM hoteles WHERE estrellas >= 4
UNION
SELECT nombre, 'N/A' AS ciudad FROM huespedes WHERE edad > 40;

-- Reglas de UNION:
-- 1. Mismo número de columnas
-- 2. Tipos de datos compatibles
-- 3. Los nombres vienen de la primera consulta
-- 4. UNION elimina duplicados, UNION ALL no
