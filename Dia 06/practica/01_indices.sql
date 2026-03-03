-- =====================================================
-- PRÁCTICA: ÍNDICES
-- =====================================================

-- Asegurarse de usar el esquema dia06

-- Ver índices existentes
SELECT tablename, indexname, indexdef 
FROM pg_indexes 
WHERE schemaname = 'public';

-- Crear índice simple
CREATE INDEX idx_productos_categoria ON productos_tienda(categoria);

-- Crear índice compuesto (múltiples columnas)
CREATE INDEX idx_ventas_producto_fecha ON ventas_online(id_producto, fecha_venta);

-- Crear índice único
CREATE UNIQUE INDEX idx_productos_nombre ON productos_tienda(nombre);

-- Índice parcial (solo algunos registros)
CREATE INDEX idx_productos_disponibles 
ON productos_tienda(nombre) 
WHERE stock > 0;

-- Ver el tamaño de los índices
SELECT 
    tablename,
    indexname,
    pg_size_pretty(pg_relation_size(indexrelid)) AS index_size
FROM pg_stat_user_indexes;

-- Ver uso de índices
SELECT 
    schemaname,
    tablename,
    indexname,
    idx_scan AS veces_usado,
    idx_tup_read AS filas_leidas
FROM pg_stat_user_indexes
WHERE schemaname = 'public'
ORDER BY idx_scan DESC;

-- Eliminar un índice
-- DROP INDEX idx_productos_categoria;

-- Reindexar (reconstruir índice)
-- REINDEX INDEX idx_productos_categoria;
-- REINDEX TABLE productos_tienda;

-- Cuándo usar índices:
-- ✓ Columnas en WHERE frecuentemente
-- ✓ Columnas en JOIN
-- ✓ Columnas en ORDER BY
-- ✗ Tablas pequeñas
-- ✗ Columnas que cambian mucho
-- ✗ Columnas con pocos valores únicos
