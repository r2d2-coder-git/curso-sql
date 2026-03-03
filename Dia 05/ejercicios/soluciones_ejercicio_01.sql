-- =====================================================
-- SOLUCIONES EJERCICIO 1: Sistema de Biblioteca
-- =====================================================

-- 1. Crear tablas con relaciones (ver insert_data.sql)

-- 2. Insertar datos (ver insert_data.sql)

-- 3. Constraint para fechas
ALTER TABLE dia05.prestamos 
ADD CONSTRAINT check_fechas_prestamo 
CHECK (fecha_devolucion IS NULL OR fecha_devolucion > fecha_prestamo);

-- 4. INNER JOIN: Préstamos activos
SELECT 
    l.titulo AS libro,
    a.nombre AS autor,
    s.nombre AS socio,
    p.fecha_prestamo
FROM dia05.prestamos p
INNER JOIN dia05.libros l ON p.id_libro = l.id_libro
INNER JOIN dia05.autores a ON l.id_autor = a.id_autor
INNER JOIN dia05.socios s ON p.id_socio = s.id_socio
WHERE p.fecha_devolucion IS NULL;

-- 5. LEFT JOIN: Libros y veces prestados
SELECT 
    l.titulo,
    a.nombre AS autor,
    COUNT(p.id_prestamo) AS veces_prestado
FROM dia05.libros l
LEFT JOIN dia05.autores a ON l.id_autor = a.id_autor
LEFT JOIN dia05.prestamos p ON l.id_libro = p.id_libro
GROUP BY l.id_libro, l.titulo, a.nombre
ORDER BY veces_prestado DESC;

-- 6. LEFT JOIN: Socios sin préstamos
SELECT s.nombre, s.email
FROM dia05.socios s
LEFT JOIN dia05.prestamos p ON s.id_socio = p.id_socio
WHERE p.id_prestamo IS NULL;

-- 7. Libros más prestados con autor
SELECT 
    l.titulo,
    a.nombre AS autor,
    COUNT(p.id_prestamo) AS total_prestamos
FROM dia05.libros l
INNER JOIN dia05.autores a ON l.id_autor = a.id_autor
INNER JOIN dia05.prestamos p ON l.id_libro = p.id_libro
GROUP BY l.id_libro, l.titulo, a.nombre
ORDER BY total_prestamos DESC
LIMIT 5;

-- 8. UNION: Nombres de autores y socios
SELECT nombre, 'Autor' AS tipo FROM dia05.autores
UNION
SELECT nombre, 'Socio' AS tipo FROM dia05.socios
ORDER BY nombre;

-- 9. Crear relación N-N: Categorías
CREATE TABLE dia05.categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE dia05.libro_categorias (
    id_libro INTEGER,
    id_categoria INTEGER,
    PRIMARY KEY (id_libro, id_categoria),
    FOREIGN KEY (id_libro) REFERENCES dia05.libros(id_libro),
    FOREIGN KEY (id_categoria) REFERENCES dia05.categorias(id_categoria)
);

INSERT INTO dia05.categorias (nombre) VALUES
    ('Ficción'), ('Realismo Mágico'), ('Novela Histórica'), ('Cuentos');

INSERT INTO dia05.libro_categorias (id_libro, id_categoria) VALUES
    (1, 1), (1, 2),
    (2, 1), (2, 2),
    (3, 1), (3, 3),
    (7, 4), (8, 4);

-- 10. Libros con sus categorías
SELECT 
    l.titulo,
    a.nombre AS autor,
    STRING_AGG(c.nombre, ', ') AS categorias
FROM dia05.libros l
INNER JOIN dia05.autores a ON l.id_autor = a.id_autor
LEFT JOIN dia05.libro_categorias lc ON l.id_libro = lc.id_libro
LEFT JOIN dia05.categorias c ON lc.id_categoria = c.id_categoria
GROUP BY l.id_libro, l.titulo, a.nombre
ORDER BY l.titulo;
