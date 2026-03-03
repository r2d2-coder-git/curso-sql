-- =====================================================
-- DÍA 2: CREAR ESQUEMA Y TABLAS
-- Tema: Restaurante (Prácticas) + Ejercicios
-- =====================================================

-- Crear esquema para el día 2
CREATE SCHEMA IF NOT EXISTS dia02;

-- =====================================================
-- TABLAS DE PRÁCTICA: Restaurante
-- =====================================================

CREATE TABLE dia02.platos (
    id_plato SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(6,2),
    disponible BOOLEAN DEFAULT true
);

CREATE TABLE dia02.categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- =====================================================
-- TABLAS DE EJERCICIOS
-- =====================================================

-- EJERCICIO 1: Gestión de Productos de una Tienda
CREATE TABLE dia02.productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    precio DECIMAL(8,2),
    stock INTEGER
);

-- EJERCICIO 2: Sistema de Gestión de Empleados
CREATE TABLE dia02.empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    activo BOOLEAN DEFAULT true
);
