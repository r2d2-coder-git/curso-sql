-- =====================================================
-- EJERCICIO 1: Sistema de Biblioteca
-- =====================================================

-- 1. Crea las siguientes tablas con sus relaciones:
--
--    Tabla "autores":
--    - id_autor (PK, autoincremental)
--    - nombre (texto, no nulo)
--    - nacionalidad (texto)
--
--    Tabla "libros":
--    - id_libro (PK, autoincremental)
--    - titulo (texto, no nulo)
--    - id_autor (FK a autores)
--    - año_publicacion (entero)
--    - isbn (texto, único)
--
--    Tabla "socios":
--    - id_socio (PK, autoincremental)
--    - nombre (texto, no nulo)
--    - email (texto, único)
--    - fecha_registro (fecha)
--
--    Tabla "prestamos":
--    - id_prestamo (PK, autoincremental)
--    - id_libro (FK a libros)
--    - id_socio (FK a socios)
--    - fecha_prestamo (fecha, no nulo)
--    - fecha_devolucion (fecha, puede ser nulo)


-- 2. Inserta datos de ejemplo (al menos 4 autores, 8 libros, 5 socios, 6 préstamos)


-- 3. Agrega un CONSTRAINT para que fecha_devolucion sea posterior a fecha_prestamo


-- 4. Usa INNER JOIN para listar todos los préstamos activos (sin devolver)
--    mostrando: título del libro, nombre del autor, nombre del socio, fecha de préstamo


-- 5. Usa LEFT JOIN para mostrar todos los libros y cuántas veces han sido prestados


-- 6. Usa LEFT JOIN para encontrar socios que nunca han tomado un libro prestado


-- 7. Usa múltiples JOINs para mostrar los libros más prestados con información del autor


-- 8. Usa UNION para crear una lista combinada de nombres de autores y socios


-- 9. Crea una relación N-N: tabla "categorias" y tabla intermedia "libro_categorias"
--    (un libro puede tener varias categorías, una categoría puede tener varios libros)


-- 10. Usa JOINs para mostrar todos los libros con sus categorías
