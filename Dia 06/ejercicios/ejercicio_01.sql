-- =====================================================
-- EJERCICIO 1: Optimización de Base de Datos de Blog
-- =====================================================

-- Asegurarse de usar el esquema dia06

-- 1. Crea las siguientes tablas:
--    
--    Tabla "usuarios_blog":
--    - id_usuario (entero, clave primaria, autoincremental)
--    - username (texto de máximo 50 caracteres, único)
--    - email (texto de máximo 100 caracteres, único)
--    - fecha_registro (timestamp)
--
--    Tabla "articulos":
--    - id_articulo (entero, clave primaria, autoincremental)
--    - titulo (texto de máximo 200 caracteres)
--    - contenido (texto)
--    - id_autor (entero, FK a usuarios_blog)
--    - fecha_publicacion (timestamp)
--    - visitas (entero, default 0)


-- 2. Inserta al menos 5 usuarios y 15 artículos


-- 3. Crea un índice en la columna "fecha_publicacion" de la tabla articulos


-- 4. Crea un índice compuesto en (id_autor, fecha_publicacion)


-- 5. Usa EXPLAIN ANALYZE para comparar el rendimiento de una consulta
--    antes y después de crear los índices


-- 6. Crea un procedimiento almacenado llamado "incrementar_visitas"
--    que reciba un id_articulo y aumente las visitas en 1


-- 7. Crea un procedimiento almacenado "publicar_articulo" que:
--    - Reciba: titulo, contenido, id_autor
--    - Inserte un nuevo artículo con fecha_publicacion = NOW()
--    - Retorne un mensaje de confirmación


-- 8. Crea una función que calcule el promedio de visitas de los artículos
--    de un autor específico


-- 9. Usa EXPLAIN para analizar esta consulta y proponer mejoras:
--    SELECT u.username, COUNT(a.id_articulo) as total_articulos
--    FROM usuarios_blog u
--    LEFT JOIN articulos a ON u.id_usuario = a.id_autor
--    WHERE a.fecha_publicacion > '2024-01-01'
--    GROUP BY u.username;


-- 10. Consulta las estadísticas de uso de las tablas (pg_stat_user_tables)
--     y determina qué tabla tiene más lecturas secuenciales
