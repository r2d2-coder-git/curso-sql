-- =====================================================
-- DÍA 5: CREAR ESQUEMA Y TABLAS
-- Tema: Reservas de Hotel (Prácticas) + Ejercicios
-- =====================================================

-- Crear esquema para el día 5
CREATE SCHEMA IF NOT EXISTS dia05;

-- Establecer el esquema como predeterminado para esta sesión

-- =====================================================
-- TABLAS DE PRÁCTICA: Sistema de Reservas de Hotel
-- =====================================================

CREATE TABLE dia05.hoteles (
    id_hotel SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    estrellas INTEGER CHECK (estrellas BETWEEN 1 AND 5)
);

CREATE TABLE dia05.habitaciones (
    id_habitacion SERIAL PRIMARY KEY,
    id_hotel INTEGER NOT NULL,
    numero_habitacion VARCHAR(10) NOT NULL,
    tipo VARCHAR(50),
    precio_noche DECIMAL(6,2),
    FOREIGN KEY (id_hotel) REFERENCES dia05.hoteles(id_hotel)
);

CREATE TABLE dia05.huespedes (
    id_huesped SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE dia05.reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_habitacion INTEGER NOT NULL,
    id_huesped INTEGER NOT NULL,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    total DECIMAL(8,2),
    FOREIGN KEY (id_habitacion) REFERENCES dia05.habitaciones(id_habitacion),
    FOREIGN KEY (id_huesped) REFERENCES dia05.huespedes(id_huesped)
);

CREATE TABLE dia05.servicios (
    id_servicio SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

CREATE TABLE dia05.hotel_servicios (
    id_hotel INTEGER NOT NULL,
    id_servicio INTEGER NOT NULL,
    PRIMARY KEY (id_hotel, id_servicio),
    FOREIGN KEY (id_hotel) REFERENCES dia05.hoteles(id_hotel),
    FOREIGN KEY (id_servicio) REFERENCES dia05.servicios(id_servicio)
);

CREATE TABLE dia05.gerentes (
    id_gerente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    id_hotel INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (id_hotel) REFERENCES dia05.hoteles(id_hotel)
);

-- =====================================================
-- TABLAS DE EJERCICIOS
-- =====================================================

-- EJERCICIO 1: Sistema de Biblioteca
CREATE TABLE dia05.autores (
    id_autor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

CREATE TABLE dia05.libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_autor INTEGER,
    año_publicacion INTEGER,
    isbn VARCHAR(20) UNIQUE,
    FOREIGN KEY (id_autor) REFERENCES dia05.autores(id_autor)
);

CREATE TABLE dia05.socios (
    id_socio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE
);

CREATE TABLE dia05.prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_libro INTEGER,
    id_socio INTEGER,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (id_libro) REFERENCES dia05.libros(id_libro),
    FOREIGN KEY (id_socio) REFERENCES dia05.socios(id_socio)
);

-- EJERCICIO 2: Sistema de Gestión Universitaria
CREATE TABLE dia05.profesores (
    id_profesor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE dia05.asignaturas (
    id_asignatura SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INTEGER,
    id_profesor INTEGER,
    FOREIGN KEY (id_profesor) REFERENCES dia05.profesores(id_profesor)
);

CREATE TABLE dia05.estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    carrera VARCHAR(100),
    año_ingreso INTEGER
);

CREATE TABLE dia05.matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INTEGER,
    id_asignatura INTEGER,
    nota DECIMAL(3,1),
    fecha_matricula DATE,
    FOREIGN KEY (id_estudiante) REFERENCES dia05.estudiantes(id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES dia05.asignaturas(id_asignatura)
);

-- =====================================================
-- VERIFICAR TABLAS CREADAS
-- =====================================================

-- Ver todas las tablas del esquema dia05
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'dia05'
ORDER BY table_name;

-- Para usar este esquema en futuras sesiones:
-- SET search_path TO dia05;
