-- =====================================================
-- SOLUCIONES EJERCICIO 1: Blog
-- =====================================================

-- 1 y 2. Crear tablas e insertar datos (ver insert_data.sql)

-- 3. Crear índice en fecha_publicacion
CREATE INDEX idx_articulos_fecha ON articulos(fecha_publicacion);

-- 4. Crear índice compuesto
CREATE INDEX idx_articulos_autor_fecha ON articulos(id_autor, fecha_publicacion);

-- 5. EXPLAIN ANALYZE antes y después
-- Antes de crear índices:
-- EXPLAIN ANALYZE SELECT * FROM articulos WHERE fecha_publicacion > '2024-02-01';

-- Después de crear índices:
EXPLAIN ANALYZE SELECT * FROM articulos WHERE fecha_publicacion > '2024-02-01';

-- 6. Procedimiento incrementar_visitas
CREATE OR REPLACE PROCEDURE incrementar_visitas(p_id_articulo INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE articulos 
    SET visitas = visitas + 1 
    WHERE id_articulo = p_id_articulo;
END;
$$;

-- Probar:
CALL incrementar_visitas(1);

-- 7. Procedimiento publicar_articulo
CREATE OR REPLACE PROCEDURE publicar_articulo(
    p_titulo VARCHAR,
    p_contenido TEXT,
    p_id_autor INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO articulos (titulo, contenido, id_autor, fecha_publicacion)
    VALUES (p_titulo, p_contenido, p_id_autor, NOW());
    
    RAISE NOTICE 'Artículo publicado exitosamente';
END;
$$;

-- 8. Función promedio de visitas por autor
CREATE OR REPLACE FUNCTION promedio_visitas_autor(p_id_autor INTEGER)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    promedio DECIMAL;
BEGIN
    SELECT AVG(visitas) INTO promedio
    FROM articulos
    WHERE id_autor = p_id_autor;
    
    RETURN COALESCE(promedio, 0);
END;
$$;

-- Probar:
SELECT promedio_visitas_autor(1);

-- 9. EXPLAIN para analizar consulta
EXPLAIN ANALYZE
SELECT u.username, COUNT(a.id_articulo) as total_articulos
FROM usuarios_blog u
LEFT JOIN articulos a ON u.id_usuario = a.id_autor
WHERE a.fecha_publicacion > '2024-01-01'
GROUP BY u.username;

-- Mejora sugerida: El índice idx_articulos_fecha ayuda con el WHERE

-- 10. Estadísticas de uso
SELECT 
    schemaname,
    tablename,
    seq_scan,
    seq_tup_read,
    idx_scan,
    idx_tup_fetch
FROM pg_stat_user_tables
WHERE tablename IN ('usuarios_blog', 'articulos')
ORDER BY seq_scan DESC;
