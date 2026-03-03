-- =====================================================
-- PRÁCTICA: Cómo creamos una tabla desde cero
-- CREATE TABLE / DROP TABLE
-- Tema: Restaurante
-- =====================================================

-- Asegurarse de usar el esquema dia02

-- Crear una tabla básica
CREATE TABLE IF NOT EXISTS dia02.platos (
    id_plato SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(6,2),
    disponible BOOLEAN DEFAULT true
);

-- Ver la estructura de la tabla creada
-- En psql: \d dia02.platos

-- Crear otra tabla independiente
CREATE TABLE IF NOT EXISTS dia02.categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- ELIMINAR TABLAS (¡CUIDADO! Esto borra la tabla y todos sus datos)

-- Eliminar una tabla solo si existe
DROP TABLE IF EXISTS dia02.categorias;

-- Eliminar una tabla y todas las que dependen de ella
DROP TABLE dia02.platos CASCADE;

-- Ver todas las tablas creadas en el esquema dia02
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'dia02';
