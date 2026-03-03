-- =====================================================
-- EJERCICIO 1: Gestión de Productos de una Tienda
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- 1. Crea una tabla llamada "productos" con las siguientes columnas:
--    - id_producto (entero, clave primaria, autoincremental)
--    - nombre (texto de máximo 100 caracteres, no nulo)
--    - marca (texto de máximo 50 caracteres)
--    - precio (decimal con 2 decimales)
--    - stock (entero)


-- 2. Inserta los siguientes productos:
--    - Laptop Dell, marca: Dell, precio: 899.99, stock: 15
--    - Mouse Inalámbrico, marca: Logitech, precio: 25.50, stock: 50
--    - Teclado Mecánico, marca: Corsair, precio: 120.00, stock: 30
--    - Monitor 24", marca: Samsung, precio: 180.00, stock: 20
--    - Webcam HD, marca: Logitech, precio: 65.00, stock: 0


-- 3. Selecciona todos los productos que tengan stock mayor a 20


-- 4. Selecciona el nombre y precio de los productos de la marca "Logitech"


-- 5. Actualiza el stock de "Webcam HD" a 10 unidades


-- 6. Selecciona los productos cuyo precio esté entre 50 y 150 euros


-- 7. Elimina los productos que tengan stock igual a 0


-- 8. Elimina todos los productos de la marca "Corsair"


-- 9. Elimina los productos cuyo precio sea mayor a 500 euros y devuelve
--    los registros eliminados (usa RETURNING)


-- 10. Selecciona 3 productos (LIMIT)


-- 11. Selecciona nombre como "producto" y precio como "coste_euros" 
--     de todos los productos


-- 12. Selecciona todos los productos cuyo nombre contenga la palabra "Mouse"
