-- =====================================================
-- PRÁCTICA: Cómo actualizamos datos en una tabla
-- UPDATE TABLE WHERE
-- =====================================================

-- Actualizar un solo campo de un registro específico
UPDATE platos 
SET disponible = true 
WHERE nombre = 'Chuletón de Buey';

-- Actualizar múltiples columnas a la vez
UPDATE platos 
SET precio = 16.00, disponible = true 
WHERE nombre = 'Paella Valenciana';

-- Actualizar basándose en una condición
UPDATE platos 
SET precio = precio * 1.10 
WHERE categoria = 'Carnes';

-- Actualizar múltiples registros
UPDATE platos 
SET disponible = false 
WHERE precio > 25.00;

-- Actualizar con cálculos
UPDATE platos 
SET precio = ROUND(precio * 0.95, 2) 
WHERE categoria = 'Entrantes';

-- Actualizar todos los registros (¡CUIDADO!)
-- UPDATE platos SET disponible = true;

-- Actualizar y ver los registros afectados
UPDATE platos 
SET categoria = 'Sopas Frías' 
WHERE nombre LIKE '%Gazpacho%' OR nombre LIKE '%Salmorejo%'
RETURNING *;

-- Actualizar basándose en otra tabla (ejemplo conceptual)
-- UPDATE platos p
-- SET precio = precio * 1.05
-- WHERE EXISTS (
--     SELECT 1 FROM categorias_premium cp 
--     WHERE cp.nombre = p.categoria
-- );

-- Ver los cambios
SELECT * FROM platos;
