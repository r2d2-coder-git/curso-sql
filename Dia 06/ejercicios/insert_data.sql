-- =====================================================
-- DATOS PARA EJERCICIOS DEL DÍA 6
-- =====================================================

-- Asegurarse de usar el esquema dia06

-- EJERCICIO 1: Optimización de Base de Datos de Blog
CREATE TABLE IF NOT EXISTS usuarios_blog (
    id_usuario SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS articulos (
    id_articulo SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    contenido TEXT,
    id_autor INTEGER,
    fecha_publicacion TIMESTAMP DEFAULT NOW(),
    visitas INTEGER DEFAULT 0,
    FOREIGN KEY (id_autor) REFERENCES usuarios_blog(id_usuario)
);

INSERT INTO usuarios_blog (username, email, fecha_registro) VALUES
    ('juan_tech', 'juan@blog.com', '2023-01-15 10:00:00'),
    ('maria_code', 'maria@blog.com', '2023-02-20 14:30:00'),
    ('carlos_dev', 'carlos@blog.com', '2023-03-10 09:15:00'),
    ('ana_data', 'ana@blog.com', '2023-04-05 16:45:00'),
    ('pedro_sql', 'pedro@blog.com', '2023-05-12 11:20:00');

INSERT INTO articulos (titulo, contenido, id_autor, fecha_publicacion, visitas) VALUES
    ('Introducción a PostgreSQL', 'Contenido del artículo...', 1, '2024-01-10 10:00:00', 1250),
    ('Índices en Bases de Datos', 'Contenido del artículo...', 1, '2024-01-15 14:00:00', 980),
    ('Python para Data Science', 'Contenido del artículo...', 2, '2024-01-20 09:00:00', 2100),
    ('Machine Learning Básico', 'Contenido del artículo...', 2, '2024-01-25 11:00:00', 1850),
    ('JavaScript Moderno', 'Contenido del artículo...', 3, '2024-02-01 15:00:00', 1420),
    ('React Hooks', 'Contenido del artículo...', 3, '2024-02-05 10:00:00', 1680),
    ('SQL Avanzado', 'Contenido del artículo...', 5, '2024-02-10 13:00:00', 1100),
    ('Optimización de Consultas', 'Contenido del artículo...', 5, '2024-02-15 16:00:00', 890),
    ('Docker para Desarrolladores', 'Contenido del artículo...', 1, '2024-02-20 12:00:00', 1560),
    ('Git y GitHub', 'Contenido del artículo...', 3, '2024-02-25 14:00:00', 2050),
    ('APIs REST', 'Contenido del artículo...', 2, '2024-03-01 10:00:00', 1320),
    ('Seguridad Web', 'Contenido del artículo...', 4, '2024-03-05 15:00:00', 1150),
    ('Testing en Python', 'Contenido del artículo...', 4, '2024-03-10 11:00:00', 980),
    ('CI/CD Pipelines', 'Contenido del artículo...', 1, '2024-03-15 13:00:00', 1240),
    ('Microservicios', 'Contenido del artículo...', 3, '2024-03-20 09:00:00', 1780);

-- EJERCICIO 2: Sistema de Inventario Avanzado
CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS productos_inventario (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_proveedor INTEGER,
    precio_compra DECIMAL(8,2),
    precio_venta DECIMAL(8,2),
    stock_actual INTEGER DEFAULT 0,
    stock_minimo INTEGER DEFAULT 10,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS movimientos (
    id_movimiento SERIAL PRIMARY KEY,
    id_producto INTEGER,
    tipo VARCHAR(10) CHECK (tipo IN ('ENTRADA', 'SALIDA')),
    cantidad INTEGER,
    fecha_movimiento TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (id_producto) REFERENCES productos_inventario(id_producto)
);

INSERT INTO proveedores (nombre, pais) VALUES
    ('TechSupply Inc', 'USA'),
    ('EuroComponents', 'Alemania'),
    ('AsiaElectronics', 'China'),
    ('IberiaDistribución', 'España');

INSERT INTO productos_inventario (nombre, id_proveedor, precio_compra, precio_venta, stock_actual, stock_minimo) VALUES
    ('Laptop Dell XPS', 1, 800.00, 1200.00, 15, 5),
    ('Monitor LG 27"', 2, 150.00, 250.00, 30, 10),
    ('Teclado Mecánico', 3, 40.00, 80.00, 50, 20),
    ('Mouse Inalámbrico', 3, 15.00, 35.00, 100, 30),
    ('Webcam HD', 1, 45.00, 90.00, 25, 10),
    ('Auriculares Bluetooth', 3, 30.00, 70.00, 40, 15),
    ('Disco SSD 1TB', 2, 80.00, 150.00, 20, 8),
    ('Memoria RAM 16GB', 2, 50.00, 100.00, 35, 15),
    ('Cable HDMI', 4, 5.00, 15.00, 200, 50),
    ('Hub USB-C', 1, 25.00, 50.00, 45, 20);

INSERT INTO movimientos (id_producto, tipo, cantidad, fecha_movimiento) VALUES
    (1, 'ENTRADA', 20, '2024-01-10 10:00:00'),
    (1, 'SALIDA', 5, '2024-01-15 14:00:00'),
    (2, 'ENTRADA', 50, '2024-01-12 09:00:00'),
    (2, 'SALIDA', 20, '2024-01-20 11:00:00'),
    (3, 'ENTRADA', 100, '2024-01-15 13:00:00'),
    (3, 'SALIDA', 50, '2024-01-25 15:00:00'),
    (4, 'ENTRADA', 150, '2024-01-18 10:00:00'),
    (4, 'SALIDA', 50, '2024-02-01 12:00:00'),
    (5, 'ENTRADA', 30, '2024-01-20 14:00:00'),
    (5, 'SALIDA', 5, '2024-02-05 16:00:00'),
    (6, 'ENTRADA', 60, '2024-01-22 11:00:00'),
    (6, 'SALIDA', 20, '2024-02-10 13:00:00'),
    (7, 'ENTRADA', 25, '2024-01-25 09:00:00'),
    (7, 'SALIDA', 5, '2024-02-15 10:00:00'),
    (8, 'ENTRADA', 40, '2024-01-28 15:00:00'),
    (8, 'SALIDA', 5, '2024-02-20 14:00:00'),
    (9, 'ENTRADA', 250, '2024-02-01 10:00:00'),
    (9, 'SALIDA', 50, '2024-02-25 11:00:00'),
    (10, 'ENTRADA', 50, '2024-02-05 12:00:00'),
    (10, 'SALIDA', 5, '2024-03-01 13:00:00');
