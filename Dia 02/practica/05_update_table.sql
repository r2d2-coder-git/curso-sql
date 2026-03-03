-- =====================================================
-- PRÁCTICA: Cómo actualizamos datos en una tabla
-- UPDATE TABLE WHERE
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Actualizar un solo campo de un registro específico
UPDATE dia02.platos 
SET disponible = true 
WHERE nombre = 'Chuletón de Buey';

-- Actualizar múltiples columnas a la vez
UPDATE dia02.platos 
SET precio = 16.00, disponible = true 
WHERE nombre = 'Paella Valenciana';

-- Actualizar basándose en una condición
UPDATE dia02.platos 
SET precio = precio * 1.10 
WHERE categoria = 'Carnes';

-- Actualizar múltiples registros
UPDATE dia02.platos 
SET disponible = false 
WHERE precio > 25.00;

-- Actualizar con cálculos
UPDATE dia02.platos 
SET precio = ROUND(precio * 0.95, 2) 
WHERE categoria = 'Entrantes';

-- Actualizar y ver los registros afectados
UPDATE dia02.platos 
SET categoria = 'Sopas Frías' 
WHERE nombre LIKE '%Gazpacho%' OR nombre LIKE '%Salmorejo%'
RETURNING *;

-- Ver los cambios
SELECT * FROM dia02.platos;

-- Actualizar en la tabla categorias
UPDATE dia02.categorias
SET descripcion = 'Platos de arroz tradicionales españoles'
WHERE nombre = 'Arroces';

-- Actualizar múltiples categorias
UPDATE dia02.categorias
SET descripcion = 'Sin descripción disponible'
WHERE descripcion IS NULL;

SELECT * FROM dia02.categorias;
