-- =====================================================
-- SOLUCIONES EJERCICIO 2: Inventario Avanzado
-- =====================================================

-- 1 y 2. Crear tablas e insertar datos (ver insert_data.sql)

-- 3. Crear índices
CREATE INDEX idx_productos_proveedor ON dia06.productos_inventario(id_proveedor);
CREATE INDEX idx_movimientos_fecha ON dia06.movimientos(fecha_movimiento);
CREATE INDEX idx_movimientos_producto_tipo ON dia06.movimientos(id_producto, tipo);

-- 4. Procedimiento registrar_entrada
CREATE OR REPLACE PROCEDURE dia06.registrar_entrada(p_id_producto INTEGER, p_cantidad INTEGER)
LANGUAGE plpgsql
AS $
BEGIN
    INSERT INTO dia06.movimientos (id_producto, tipo, cantidad, fecha_movimiento)
    VALUES (p_id_producto, 'ENTRADA', p_cantidad, NOW());
    UPDATE dia06.productos_inventario
    SET stock_actual = stock_actual + p_cantidad
    WHERE id_producto = p_id_producto;
    RAISE NOTICE 'Entrada registrada: % unidades', p_cantidad;
END;
$;

-- 5. Procedimiento registrar_salida
CREATE OR REPLACE PROCEDURE dia06.registrar_salida(p_id_producto INTEGER, p_cantidad INTEGER)
LANGUAGE plpgsql
AS $
DECLARE
    v_stock_actual INTEGER;
BEGIN
    SELECT stock_actual INTO v_stock_actual
    FROM dia06.productos_inventario WHERE id_producto = p_id_producto;
    IF v_stock_actual >= p_cantidad THEN
        INSERT INTO dia06.movimientos (id_producto, tipo, cantidad, fecha_movimiento)
        VALUES (p_id_producto, 'SALIDA', p_cantidad, NOW());
        UPDATE dia06.productos_inventario
        SET stock_actual = stock_actual - p_cantidad
        WHERE id_producto = p_id_producto;
    ELSE
        RAISE EXCEPTION 'Stock insuficiente. Disponible: %, Solicitado: %', v_stock_actual, p_cantidad;
    END IF;
END;
$;

-- 6. Función calcular_margen
CREATE OR REPLACE FUNCTION dia06.calcular_margen(p_id_producto INTEGER)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $
DECLARE
    v_margen DECIMAL;
BEGIN
    SELECT ((precio_venta - precio_compra) / precio_compra * 100)
    INTO v_margen
    FROM dia06.productos_inventario WHERE id_producto = p_id_producto;
    RETURN ROUND(v_margen, 2);
END;
$;

-- 7. Función productos_bajo_stock
CREATE OR REPLACE FUNCTION dia06.productos_bajo_stock()
RETURNS TABLE (id INTEGER, nombre VARCHAR, stock_actual INTEGER, stock_minimo INTEGER)
LANGUAGE plpgsql
AS $
BEGIN
    RETURN QUERY
    SELECT p.id_producto, p.nombre, p.stock_actual, p.stock_minimo
    FROM dia06.productos_inventario p
    WHERE p.stock_actual < p.stock_minimo;
END;
$;

-- 8. EXPLAIN ANALYZE comparación
EXPLAIN ANALYZE SELECT * FROM dia06.productos_inventario WHERE stock_actual < stock_minimo;
EXPLAIN ANALYZE SELECT * FROM dia06.productos_bajo_stock();

-- 9. Procedimiento reporte de movimientos
CREATE OR REPLACE PROCEDURE dia06.reporte_movimientos(p_fecha_inicio DATE, p_fecha_fin DATE)
LANGUAGE plpgsql
AS $
BEGIN
    SELECT 
        p.nombre AS producto,
        SUM(CASE WHEN m.tipo = 'ENTRADA' THEN m.cantidad ELSE 0 END) AS total_entradas,
        SUM(CASE WHEN m.tipo = 'SALIDA' THEN m.cantidad ELSE 0 END) AS total_salidas
    FROM dia06.productos_inventario p
    LEFT JOIN dia06.movimientos m ON p.id_producto = m.id_producto
    WHERE m.fecha_movimiento BETWEEN p_fecha_inicio AND p_fecha_fin
    GROUP BY p.id_producto, p.nombre;
END;
$;

-- 10. Consultar índices no utilizados
SELECT schemaname, tablename, indexname, idx_scan
FROM pg_stat_user_indexes
WHERE schemaname = 'dia06' AND idx_scan = 0
ORDER BY tablename, indexname;
