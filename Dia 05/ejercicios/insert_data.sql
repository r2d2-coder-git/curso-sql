-- =====================================================
-- DATOS PARA EJERCICIOS DEL DÍA 5
-- =====================================================

-- EJERCICIO 1: Sistema de Biblioteca
CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_autor INTEGER,
    año_publicacion INTEGER,
    isbn VARCHAR(20) UNIQUE,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

CREATE TABLE socios (
    id_socio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    fecha_registro DATE
);

CREATE TABLE prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_libro INTEGER,
    id_socio INTEGER,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro),
    FOREIGN KEY (id_socio) REFERENCES socios(id_socio)
);

INSERT INTO autores (nombre, nacionalidad) VALUES
    ('Gabriel García Márquez', 'Colombiana'),
    ('Isabel Allende', 'Chilena'),
    ('Mario Vargas Llosa', 'Peruana'),
    ('Jorge Luis Borges', 'Argentina');

INSERT INTO libros (titulo, id_autor, año_publicacion, isbn) VALUES
    ('Cien años de soledad', 1, 1967, '978-0307474728'),
    ('El amor en los tiempos del cólera', 1, 1985, '978-0307389732'),
    ('La casa de los espíritus', 2, 1982, '978-1501117015'),
    ('Paula', 2, 1994, '978-0060927219'),
    ('La ciudad y los perros', 3, 1963, '978-8420412146'),
    ('Conversación en La Catedral', 3, 1969, '978-8420471358'),
    ('Ficciones', 4, 1944, '978-0802130303'),
    ('El Aleph', 4, 1949, '978-8420633114');

INSERT INTO socios (nombre, email, fecha_registro) VALUES
    ('Ana Martínez', 'ana.m@email.com', '2023-01-15'),
    ('Carlos Ruiz', 'carlos.r@email.com', '2023-02-20'),
    ('Laura Gómez', 'laura.g@email.com', '2023-03-10'),
    ('Pedro Sánchez', 'pedro.s@email.com', '2023-04-05'),
    ('María López', 'maria.l@email.com', '2023-05-12');

INSERT INTO prestamos (id_libro, id_socio, fecha_prestamo, fecha_devolucion) VALUES
    (1, 1, '2024-01-10', '2024-01-24'),
    (3, 1, '2024-02-05', '2024-02-19'),
    (2, 2, '2024-01-15', '2024-01-29'),
    (5, 3, '2024-02-01', NULL),
    (7, 4, '2024-02-10', NULL),
    (4, 2, '2024-02-15', '2024-03-01');

-- EJERCICIO 2: Sistema Universitario
CREATE TABLE profesores (
    id_profesor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE asignaturas (
    id_asignatura SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INTEGER,
    id_profesor INTEGER,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);

CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    carrera VARCHAR(100),
    año_ingreso INTEGER
);

CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INTEGER,
    id_asignatura INTEGER,
    nota DECIMAL(3,1),
    fecha_matricula DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura)
);

INSERT INTO profesores (nombre, departamento, email) VALUES
    ('Dr. Juan García', 'Matemáticas', 'juan.garcia@uni.edu'),
    ('Dra. María López', 'Física', 'maria.lopez@uni.edu'),
    ('Dr. Carlos Ruiz', 'Informática', 'carlos.ruiz@uni.edu'),
    ('Dra. Ana Martínez', 'Química', 'ana.martinez@uni.edu');

INSERT INTO asignaturas (nombre, creditos, id_profesor) VALUES
    ('Cálculo I', 6, 1),
    ('Álgebra Lineal', 6, 1),
    ('Física I', 6, 2),
    ('Programación I', 6, 3),
    ('Bases de Datos', 6, 3),
    ('Química General', 6, 4);

INSERT INTO estudiantes (nombre, carrera, año_ingreso) VALUES
    ('Pedro Sánchez', 'Ingeniería Informática', 2022),
    ('Laura Fernández', 'Ingeniería Informática', 2022),
    ('Miguel Torres', 'Física', 2023),
    ('Carmen Díaz', 'Química', 2023),
    ('Roberto Gil', 'Ingeniería Informática', 2021),
    ('Elena Romero', 'Física', 2022),
    ('David Moreno', 'Química', 2023),
    ('Isabel Vega', 'Ingeniería Informática', 2021);

INSERT INTO matriculas (id_estudiante, id_asignatura, nota, fecha_matricula) VALUES
    (1, 1, 7.5, '2023-09-01'),
    (1, 4, 8.2, '2023-09-01'),
    (2, 1, 6.8, '2023-09-01'),
    (2, 4, 9.1, '2023-09-01'),
    (3, 1, 5.5, '2024-09-01'),
    (3, 3, 7.0, '2024-09-01'),
    (4, 6, 8.5, '2024-09-01'),
    (5, 4, 9.5, '2022-09-01'),
    (5, 5, 8.8, '2022-09-01'),
    (6, 3, 7.2, '2023-09-01'),
    (7, 6, 6.9, '2024-09-01'),
    (8, 4, 8.0, '2022-09-01'),
    (8, 5, 7.5, '2022-09-01'),
    (1, 5, NULL, '2024-09-01'),
    (2, 5, NULL, '2024-09-01');
