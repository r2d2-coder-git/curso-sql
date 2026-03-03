-- =====================================================
-- DÍA 6: CREAR ESQUEMA Y TABLAS
-- Tema: E-commerce (Prácticas) + Ejercicios
-- =====================================================

-- Crear esquema para el día 6
CREATE SCHEMA IF NOT EXISTS dia06;

-- Establecer el esquema como predeterminado para esta sesión

-- =====================================================
-- TABLAS DE PRÁCTICA: Sistema de E-commerce
-- =====================================================

CREATE TABLE dia06.productos_tienda (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(8,2),
    stock INTEGER
);

CREATE TABLE dia06.ventas_online (
    id_venta SERIAL PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha_venta TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (id_producto) REFERENCES dia06.productos_tienda(id_producto)
);

-- =====================================================
-- TABLAS DE EJERCICIOS
-- =====================================================

-- EJERCICIO 1: Optimización de Base de Datos de Blog
CREATE TABLE dia06.usuarios_blog (
    id_usuario SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT NOW()
);

CREATE TABLE dia06.articulos (
    id_articulo SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    contenido TEXT,
    id_autor INTEGER,
    fecha_publicacion TIMESTAMP DEFAULT NOW(),
    visitas INTEGER DEFAULT 0,
    FOREIGN KEY (id_autor) REFERENCES dia06.usuarios_blog(id_usuario)
);

-- EJERCICIO 2: Sistema de Inventario Avanzado
CREATE TABLE dia06.proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);

CREATE TABLE dia06.productos_inventario (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_proveedor INTEGER,
    precio_compra DECIMAL(8,2),
    precio_venta DECIMAL(8,2),
    stock_actual INTEGER DEFAULT 0,
    stock_minimo INTEGER DEFAULT 10,
    FOREIGN KEY (id_proveedor) REFERENCES dia06.proveedores(id_proveedor)
);

CREATE TABLE dia06.movimientos (
    id_movimiento SERIAL PRIMARY KEY,
    id_producto INTEGER,
    tipo VARCHAR(10) CHECK (tipo IN ('ENTRADA', 'SALIDA')),
    cantidad INTEGER,
    fecha_movimiento TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (id_producto) REFERENCES dia06.productos_inventario(id_producto)
);

-- =====================================================
-- VERIFICAR TABLAS CREADAS
-- =====================================================

-- Ver todas las tablas del esquema dia06
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'dia06'
ORDER BY table_name;

-- Para usar este esquema en futuras sesiones:
-- SET search_path TO dia06;
