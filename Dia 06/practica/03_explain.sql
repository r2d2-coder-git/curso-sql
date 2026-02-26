-- =====================================================
-- PRÁCTICA: EXPLAIN (Análisis de consultas)
-- =====================================================

-- EXPLAIN básico: muestra el plan de ejecución
EXPLAIN 
SELECT * FROM productos_tienda WHERE categoria = 'Electrónica';

-- EXPLAIN ANALYZE: ejecuta y muestra tiempos reales
EXPLAIN ANALYZE 
SELECT p.nombre, SUM(v.total) as total_ventas
FROM productos_tienda p
JOIN ventas_online v ON p.id_producto = v.id_producto
GROUP BY p.nombre;

-- EXPLAIN con más detalles
EXPLAIN (ANALYZE, BUFFERS, VERBOSE)
SELECT * FROM ventas_online WHERE fecha_venta > '2024-01-15';

-- EXPLAIN con formato JSON
EXPLAIN (FORMAT JSON) 
SELECT * FROM productos_tienda WHERE precio > 100;

-- Comparar consultas con y sin índice
-- Sin índice
EXPLAIN ANALYZE 
SELECT * FROM ventas_online WHERE id_producto = 1;

-- Crear índice
CREATE INDEX idx_ventas_producto ON ventas_online(id_producto);

-- Con índice
EXPLAIN ANALYZE 
SELECT * FROM ventas_online WHERE id_producto = 1;

-- Ver estadísticas de uso de tablas
SELECT 
    schemaname,
    tablename,
    seq_scan,        -- Escaneos secuenciales
    seq_tup_read,    -- Filas leídas secuencialmente
    idx_scan,        -- Escaneos con índice
    idx_tup_fetch    -- Filas obtenidas con índice
FROM pg_stat_user_tables
WHERE tablename IN ('productos_tienda', 'ventas_online');

-- Términos importantes en EXPLAIN:
-- - Seq Scan: Escaneo secuencial (lee toda la tabla)
-- - Index Scan: Usa un índice
-- - Cost: Estimación de costo (menor es mejor)
-- - Rows: Filas estimadas
-- - Actual time: Tiempo real de ejecución
