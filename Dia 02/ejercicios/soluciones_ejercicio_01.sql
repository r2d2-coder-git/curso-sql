-- =====================================================
-- SOLUCIONES EJERCICIO 1: Gestión de Productos
-- =====================================================

-- 1. Crear tabla productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    precio DECIMAL(8,2),
    stock INTEGER
);

-- 2. Insertar productos
INSERT INTO productos (nombre, marca, precio, stock) VALUES
    ('Laptop Dell', 'Dell', 899.99, 15),
    ('Mouse Inalámbrico', 'Logitech', 25.50, 50),
    ('Teclado Mecánico', 'Corsair', 120.00, 30),
    ('Monitor 24"', 'Samsung', 180.00, 20),
    ('Webcam HD', 'Logitech', 65.00, 0);

-- 3. Productos con stock mayor a 20
SELECT * FROM productos WHERE stock > 20;

-- 4. Nombre y precio de productos Logitech
SELECT nombre, precio FROM productos WHERE marca = 'Logitech';

-- 5. Actualizar stock de Webcam HD
UPDATE productos SET stock = 10 WHERE nombre = 'Webcam HD';

-- 6. Productos con precio entre 50 y 150
SELECT * FROM productos WHERE precio BETWEEN 50 AND 150;

-- 7. Eliminar productos con stock 0
DELETE FROM productos WHERE stock = 0;

-- 8. Los 3 productos más caros
SELECT * FROM productos ORDER BY precio DESC LIMIT 3;

-- 9. Alias para columnas
SELECT nombre AS producto, precio AS coste_euros FROM productos;

-- 10. Productos que contengan "Mouse"
SELECT * FROM productos WHERE nombre LIKE '%Mouse%';
