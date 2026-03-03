-- =====================================================
-- PRÁCTICA: Cómo borramos datos en una tabla
-- DELETE FROM WHERE
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Eliminar un registro específico
DELETE FROM dia02.platos WHERE nombre = 'Gazpacho Andaluz';

-- Eliminar basándose en una condición
DELETE FROM dia02.platos WHERE disponible = false;

-- Eliminar múltiples registros
DELETE FROM dia02.platos WHERE precio < 6.00;

-- Eliminar con múltiples condiciones
DELETE FROM dia02.platos 
WHERE categoria = 'Entrantes' AND precio > 10.00;

-- Eliminar y ver los registros eliminados
DELETE FROM dia02.platos 
WHERE nombre LIKE '%Asturiana%'
RETURNING *;

-- Eliminar todos los registros 
TRUNCATE TABLE dia02.platos

-- DIFERENCIA entre DELETE y TRUNCATE:

-- DELETE: Elimina registros uno por uno, se puede usar WHERE
-- DELETE FROM dia02.platos WHERE categoria = 'Tapas';

-- TRUNCATE: Elimina todos los registros de forma más rápida,
-- reinicia contadores, no se puede usar WHERE
-- TRUNCATE TABLE dia02.platos;
-- TRUNCATE TABLE dia02.platos RESTART IDENTITY;

-- Ver los datos restantes
SELECT * FROM dia02.platos;

-- Eliminar en la tabla categorias
DELETE FROM dia02.categorias WHERE nombre = 'Tapas';

-- Eliminar y ver los registros eliminados
DELETE FROM dia02.categorias
WHERE descripcion IS NULL
RETURNING *;

SELECT * FROM dia02.categorias;
