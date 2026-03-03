-- =====================================================
-- PRÁCTICA: Cómo ponemos comentarios en SQL
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Este es un comentario de una sola línea
-- Los comentarios ayudan a explicar el código

-- Seleccionar todos los platos disponibles
SELECT * FROM dia02.platos WHERE disponible = true;

/*
Este es un comentario
de múltiples líneas.
Útil para explicaciones más largas
o para desactivar bloques de código.
*/

SELECT nombre, precio FROM dia02.platos; -- Comentario al final de la línea

/*
Los comentarios son importantes porque:
1. Documentan el propósito del código
2. Ayudan a otros desarrolladores a entender la lógica
3. Permiten desactivar código temporalmente sin borrarlo
4. Facilitan el mantenimiento futuro
*/

-- Ejemplo de código comentado (no se ejecuta):
-- DELETE FROM dia02.platos WHERE precio > 100;

/* 
Comentario de bloque para desactivar código:
UPDATE dia02.platos 
SET precio = precio * 2 
WHERE categoria = 'Carnes';
*/

-- Buenas prácticas de comentarios:
-- 1. Ser claro y conciso
-- 2. Explicar el "por qué", no solo el "qué"
-- 3. Mantener los comentarios actualizados
-- 4. No comentar código obvio

-- Ejemplo de comentario útil:
-- Aplicamos descuento del 15% a entrantes para promoción de verano
UPDATE dia02.platos 
SET precio = precio * 0.85 
WHERE categoria = 'Entrantes';

-- Ejemplo de comentario innecesario:
-- Selecciona el nombre de la tabla platos
SELECT nombre FROM dia02.platos;
