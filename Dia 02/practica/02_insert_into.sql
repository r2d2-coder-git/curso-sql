-- =====================================================
-- PRÁCTICA: Cómo insertamos datos en una tabla
-- INSERT INTO
-- =====================================================

-- Asegurarse de tener la tabla creada
CREATE TABLE IF NOT EXISTS platos (
    id_plato SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(6,2),
    disponible BOOLEAN DEFAULT true
);

-- Insertar un registro especificando todas las columnas
INSERT INTO platos (nombre, categoria, precio, disponible) 
VALUES ('Paella Valenciana', 'Arroces', 15.50, true);

-- Insertar sin especificar columnas con valores por defecto
INSERT INTO platos (nombre, categoria, precio) 
VALUES ('Gazpacho Andaluz', 'Entrantes', 6.00);

-- Insertar múltiples registros a la vez
INSERT INTO platos (nombre, categoria, precio, disponible) 
VALUES 
    ('Pulpo a la Gallega', 'Mariscos', 18.00, true),
    ('Tortilla Española', 'Tapas', 8.50, true),
    ('Chuletón de Buey', 'Carnes', 32.00, false),
    ('Salmorejo Cordobés', 'Entrantes', 5.50, true),
    ('Fabada Asturiana', 'Guisos', 12.00, true);

-- Insertar y obtener el ID generado
INSERT INTO platos (nombre, categoria, precio) 
VALUES ('Cocido Madrileño', 'Guisos', 14.00)
RETURNING id_plato;

-- Insertar datos desde otra tabla (ejemplo conceptual)
-- INSERT INTO platos_archivo 
-- SELECT * FROM platos WHERE categoria = 'Entrantes';

-- Ver todos los datos insertados
SELECT * FROM platos;
