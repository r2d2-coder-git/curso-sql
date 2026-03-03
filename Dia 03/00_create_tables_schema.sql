-- =====================================================
-- DÍA 3: CREAR ESQUEMA Y TABLAS
-- Tema: Videojuegos (Prácticas) + Ejercicios
-- =====================================================

-- Crear esquema para el día 3
CREATE SCHEMA IF NOT EXISTS dia03;

-- Establecer el esquema como predeterminado para esta sesión

-- =====================================================
-- TABLAS DE PRÁCTICA: Tienda de Videojuegos
-- =====================================================

CREATE TABLE dia03.videojuegos (
    id_juego SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    precio DECIMAL(6,2),
    fecha_lanzamiento DATE,
    puntuacion DECIMAL(3,1),
    plataforma VARCHAR(50),
    unidades_vendidas INTEGER
);

-- =====================================================
-- TABLAS DE EJERCICIOS
-- =====================================================

-- EJERCICIO 1: Sistema de Gestión de Películas
CREATE TABLE dia03.peliculas (
    id_pelicula SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100),
    genero VARCHAR(50),
    duracion_minutos INTEGER,
    fecha_estreno DATE,
    calificacion DECIMAL(2,1),
    recaudacion_millones DECIMAL(8,2)
);

-- EJERCICIO 2: Sistema de Registro de Estudiantes
CREATE TABLE dia03.estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100),
    carrera VARCHAR(100),
    fecha_ingreso DATE,
    nota_media DECIMAL(3,2),
    creditos_completados INTEGER
);

-- =====================================================
-- VERIFICAR TABLAS CREADAS
-- =====================================================

-- Ver todas las tablas del esquema dia03
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'dia03'
ORDER BY table_name;

-- Para usar este esquema en futuras sesiones:
-- SET search_path TO dia03;
