-- =====================================================
-- DÍA 4: CREAR ESQUEMA Y TABLAS
-- Tema: Streaming de Música (Prácticas) + Ejercicios
-- =====================================================

-- Crear esquema para el día 4
CREATE SCHEMA IF NOT EXISTS dia04;

-- Establecer el esquema como predeterminado para esta sesión

-- =====================================================
-- TABLAS DE PRÁCTICA: Plataforma de Streaming
-- =====================================================

CREATE TABLE dia04.artistas (
    id_artista SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    genero_principal VARCHAR(50)
);

CREATE TABLE dia04.canciones (
    id_cancion SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_artista INTEGER,
    duracion_segundos INTEGER,
    reproducciones BIGINT,
    fecha_lanzamiento DATE,
    album VARCHAR(100),
    FOREIGN KEY (id_artista) REFERENCES dia04.artistas(id_artista)
);

-- =====================================================
-- TABLAS DE EJERCICIOS
-- =====================================================

-- EJERCICIO 1: Sistema de Ventas Online
CREATE TABLE dia04.clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE dia04.pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INTEGER,
    fecha_pedido DATE,
    total DECIMAL(10,2),
    estado VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES dia04.clientes(id_cliente)
);

-- EJERCICIO 2: Análisis de Rendimiento de Empleados
CREATE TABLE dia04.departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre_departamento VARCHAR(50),
    presupuesto DECIMAL(10,2)
);

CREATE TABLE dia04.empleados_ventas (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    id_departamento INTEGER,
    fecha_contratacion DATE,
    ventas_mes DECIMAL(10,2),
    FOREIGN KEY (id_departamento) REFERENCES dia04.departamentos(id_departamento)
);

-- =====================================================
-- VERIFICAR TABLAS CREADAS
-- =====================================================

-- Ver todas las tablas del esquema dia04
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'dia04'
ORDER BY table_name;

-- Para usar este esquema en futuras sesiones:
-- SET search_path TO dia04;
