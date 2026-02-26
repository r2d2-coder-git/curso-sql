-- =====================================================
-- PRÁCTICA: Cómo creamos una tabla desde cero
-- CREATE TABLE / DROP TABLE
-- Tema: Restaurante
-- =====================================================

-- Crear una tabla básica
CREATE TABLE platos (
    id_plato SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(6,2),
    disponible BOOLEAN DEFAULT true
);

-- Ver la estructura de la tabla creada
-- En psql: \d platos

-- Crear una tabla con más restricciones
CREATE TABLE ingredientes (
    id_ingrediente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    unidad_medida VARCHAR(20),
    stock DECIMAL(8,2) CHECK (stock >= 0),
    precio_unitario DECIMAL(6,2)
);

-- Crear una tabla con clave foránea
CREATE TABLE plato_ingredientes (
    id_plato INTEGER,
    id_ingrediente INTEGER,
    cantidad DECIMAL(6,2),
    PRIMARY KEY (id_plato, id_ingrediente),
    FOREIGN KEY (id_plato) REFERENCES platos(id_plato),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
);

-- ELIMINAR TABLAS (¡CUIDADO! Esto borra la tabla y todos sus datos)

-- Eliminar una tabla
-- DROP TABLE plato_ingredientes;

-- Eliminar una tabla solo si existe
-- DROP TABLE IF EXISTS plato_ingredientes;

-- Eliminar una tabla y todas las que dependen de ella
-- DROP TABLE platos CASCADE;

-- Ver todas las tablas creadas
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';
