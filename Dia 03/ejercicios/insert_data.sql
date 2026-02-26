-- =====================================================
-- DATOS PARA EJERCICIOS DEL DÍA 3
-- =====================================================

-- EJERCICIO 1: Sistema de Gestión de Películas
CREATE TABLE peliculas (
    id_pelicula SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100),
    genero VARCHAR(50),
    duracion_minutos INTEGER,
    fecha_estreno DATE,
    calificacion DECIMAL(2,1),
    recaudacion_millones DECIMAL(8,2)
);

INSERT INTO peliculas (titulo, director, genero, duracion_minutos, fecha_estreno, calificacion, recaudacion_millones) VALUES
    ('Oppenheimer', 'Christopher Nolan', 'Drama', 180, '2023-07-21', 8.5, 952.00),
    ('Barbie', 'Greta Gerwig', 'Comedia', 114, '2023-07-21', 7.2, 1445.00),
    ('The Batman', 'Matt Reeves', 'Acción', 176, '2022-03-04', 7.8, 770.00),
    ('Top Gun: Maverick', 'Joseph Kosinski', 'Acción', 131, '2022-05-27', 8.3, 1489.00),
    ('Avatar 2', 'James Cameron', 'Ciencia Ficción', 192, '2022-12-16', 7.6, 2320.00),
    ('Dune', 'Denis Villeneuve', 'Ciencia Ficción', 155, '2021-10-22', 8.0, 402.00),
    ('Spider-Man: No Way Home', 'Jon Watts', 'Acción', 148, '2021-12-17', 8.2, 1921.00),
    ('Guardianes de la Galaxia 3', 'James Gunn', 'Acción', 150, '2023-05-05', 7.9, 845.00),
    ('The Whale', 'Darren Aronofsky', 'Drama', 117, '2022-12-09', 7.7, NULL),
    ('Tár', 'Todd Field', 'Drama', 158, '2022-10-07', 7.4, NULL);

-- EJERCICIO 2: Sistema de Registro de Estudiantes
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100),
    carrera VARCHAR(100),
    fecha_ingreso DATE,
    nota_media DECIMAL(3,2),
    creditos_completados INTEGER
);

INSERT INTO estudiantes (nombre, apellidos, carrera, fecha_ingreso, nota_media, creditos_completados) VALUES
    ('Carlos', 'García Pérez', 'Ingeniería Informática', '2021-09-01', 8.5, 180),
    ('María', 'López Martínez', 'Medicina', '2020-09-01', 9.2, 240),
    ('Juan', 'Rodríguez Sánchez', 'Derecho', '2022-09-01', 7.1, 120),
    ('Ana', 'Fernández Gómez', 'Ingeniería Informática', '2021-09-01', 8.8, 175),
    ('Pedro', 'Martínez Ruiz', 'Arquitectura', '2023-09-01', NULL, 60),
    ('Laura', 'Sánchez Torres', 'Medicina', '2020-09-01', 9.5, 250),
    ('Diego', 'González Díaz', 'Derecho', '2022-09-01', 6.8, 115),
    ('Sofía', 'Ramírez Castro', 'Arquitectura', '2021-09-01', 7.9, 165),
    ('Miguel', 'Torres Moreno', 'Ingeniería Informática', '2023-09-01', NULL, 55),
    ('Elena', 'Jiménez Vargas', 'Medicina', '2022-09-01', 8.3, 140);
