-- =====================================================
-- PRÁCTICA: Cómo insertamos datos en una tabla
-- INSERT INTO
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Insertar un registro especificando todas las columnas
INSERT INTO dia02.platos (nombre, categoria, precio, disponible) 
VALUES ('Paella Valenciana', 'Arroces', 15.50, true);

-- Insertar sin especificar columnas con valores por defecto
INSERT INTO dia02.platos (nombre, categoria, precio) 
VALUES ('Gazpacho Andaluz', 'Entrantes', 6.00);

-- Insertar múltiples registros a la vez
INSERT INTO dia02.platos (nombre, categoria, precio, disponible) 
VALUES 
    ('Pulpo a la Gallega', 'Mariscos', 18.00, true),
    ('Tortilla Española', 'Tapas', 8.50, true),
    ('Chuletón de Buey', 'Carnes', 32.00, false),
    ('Salmorejo Cordobés', 'Entrantes', 5.50, true),
    ('Fabada Asturiana', 'Guisos', 12.00, true);

-- Insertar y obtener el ID generado
INSERT INTO dia02.platos (nombre, categoria, precio) 
VALUES ('Cocido Madrileño', 'Guisos', 14.00)
RETURNING id_plato;

-- Insertar en la tabla categorias
INSERT INTO dia02.categorias (nombre, descripcion) VALUES
    ('Arroces', 'Platos elaborados con arroz como base'),
    ('Entrantes', 'Platos para comenzar la comida'),
    ('Mariscos', 'Platos de pescado y marisco'),
    ('Tapas', 'Raciones pequeñas para compartir'),
    ('Carnes', 'Platos principales de carne'),
    ('Guisos', 'Platos de cuchara y cocidos');

-- Ver todos los datos insertados
SELECT * FROM dia02.platos;
SELECT * FROM dia02.categorias;
