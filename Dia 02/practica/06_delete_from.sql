-- =====================================================
-- PRÁCTICA: Cómo borramos datos en una tabla
-- DELETE FROM WHERE
-- =====================================================

-- Eliminar un registro específico
DELETE FROM platos WHERE nombre = 'Gazpacho Andaluz';

-- Eliminar basándose en una condición
DELETE FROM platos WHERE disponible = false;

-- Eliminar múltiples registros
DELETE FROM platos WHERE precio < 6.00;

-- Eliminar con múltiples condiciones
DELETE FROM platos 
WHERE categoria = 'Entrantes' AND precio > 10.00;

-- Eliminar y ver los registros eliminados
DELETE FROM platos 
WHERE nombre LIKE '%Asturiana%'
RETURNING *;

-- Eliminar todos los registros (¡MUCHO CUIDADO!)
-- DELETE FROM platos;

-- Eliminar con subconsulta (ejemplo conceptual)
-- DELETE FROM platos 
-- WHERE id_plato IN (
--     SELECT id_plato FROM platos WHERE precio > 30
-- );

-- DIFERENCIA entre DELETE y TRUNCATE:

-- DELETE: Elimina registros uno por uno, se puede usar WHERE
-- DELETE FROM platos WHERE categoria = 'Tapas';

-- TRUNCATE: Elimina todos los registros de forma más rápida, 
-- reinicia contadores, no se puede usar WHERE
-- TRUNCATE TABLE platos;
-- TRUNCATE TABLE platos RESTART IDENTITY; -- Reinicia el SERIAL

-- Ver los datos restantes
SELECT * FROM platos;
