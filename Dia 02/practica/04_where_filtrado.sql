-- =====================================================
-- PRÁCTICA: Cómo filtramos datos con SQL
-- WHERE, LIKE, BETWEEN, IN
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Filtro simple con WHERE
SELECT * FROM dia02.platos WHERE disponible = true;
SELECT * FROM dia02.platos WHERE disponible = false;

-- Operadores de comparación
SELECT nombre, precio FROM dia02.platos WHERE precio > 10.00;
SELECT nombre, precio FROM dia02.platos WHERE precio >= 15.00;
SELECT nombre, precio FROM dia02.platos WHERE precio < 10.00;
SELECT nombre, precio FROM dia02.platos WHERE precio <= 10.00;
SELECT nombre FROM dia02.platos WHERE categoria <> 'Tapas'; -- Diferente de
SELECT nombre FROM dia02.platos WHERE categoria != 'Tapas'; -- También válido

-- LIKE para búsquedas de texto
SELECT * FROM dia02.platos WHERE nombre LIKE '%Española%'; -- Contiene "Española"
SELECT * FROM dia02.platos WHERE nombre LIKE 'P%';         -- Empieza con "P"
SELECT * FROM dia02.platos WHERE nombre LIKE '%a';         -- Termina con "a"
SELECT * FROM dia02.platos WHERE categoria LIKE 'A%';      -- Empieza con "A"

-- ILIKE para búsquedas sin distinguir mayúsculas/minúsculas (específico de PostgreSQL)
SELECT * FROM dia02.platos WHERE nombre ILIKE '%paella%';

-- BETWEEN para rangos
SELECT nombre, precio FROM dia02.platos WHERE precio BETWEEN 5.00 AND 15.00;
SELECT nombre, precio FROM dia02.platos WHERE precio NOT BETWEEN 10.00 AND 20.00;

-- IN para múltiples valores
SELECT * FROM dia02.platos WHERE categoria IN ('Tapas', 'Entrantes', 'Arroces');
SELECT * FROM dia02.platos WHERE categoria NOT IN ('Carnes', 'Mariscos');

-- Combinar múltiples condiciones con AND
SELECT * FROM dia02.platos 
WHERE categoria = 'Entrantes' AND precio < 7.00;

-- Combinar múltiples condiciones con OR
SELECT * FROM dia02.platos 
WHERE categoria = 'Tapas' OR categoria = 'Entrantes';

-- Combinar AND y OR (usar paréntesis para claridad)
SELECT * FROM dia02.platos 
WHERE (categoria = 'Entrantes' OR categoria = 'Tapas') 
  AND precio < 10.00;

-- Filtrar valores NULL
SELECT * FROM dia02.platos WHERE categoria IS NULL;
SELECT * FROM dia02.platos WHERE categoria IS NOT NULL;

-- Filtros sobre la tabla categorias
SELECT * FROM dia02.categorias WHERE nombre LIKE 'A%';
SELECT * FROM dia02.categorias WHERE nombre IN ('Tapas', 'Entrantes', 'Guisos');
