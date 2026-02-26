-- =====================================================
-- SOLUCIONES EJERCICIO 2: Inventario Avanzado
-- =====================================================

-- 1 y 2. Crear tablas e insertar datos (ver insert_data.sql)

-- 3. Crear índices
CREATE INDEX idx_productos_proveedor ON productos_inventario(id_proveedor);
CREATE INDEX idx_movimientos_fecha ON movimientos(fecha_movimiento);
CREATE INDEX idx_movimientos_producto_tipo ON movimientos(id_producto, tipo);

-- 4. Procedimiento registrar_entrada
CREATE OR REPLACE PROCEDURE registrar_entrada(
    p_id_producto INTEGER,
    p_cantidad INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO movimientos (id_producto, tipo, cantidad, fecha_movimiento)
    VALUES (p_id_producto, 'ENTRADA', p_cantidad, NOW());
    
    UPDATE productos_inventario
    SET stock_actual = stock_actual + p_cantidad
    WHERE id_producto = p_id_producto;
    
    RAISE NOTICE 'Entrada registrada: % unidades', p_cantidad;
END;
$$;

-- 5. Procedimiento registrar_salida
CREATE OR REPLACE PROCEDURE registrar_salida(
    p_id_producto INTEGER,
    p_cantidad INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_stock_actual INTEGER;
BEGIN
    SELECT stock_actual INTO v_stock_actual
    FROM productos_inventario
    WHERE id_producto = p_id_producto;
    
    IF v_stock_actual >= p_cantidad THEN
        INSERT INTO movimientos (id_producto, tipo, cantidad, fecha_movimiento)
        VALUES (p_id_producto, 'SALIDA', p_cantidad, NOW());
        
        UPDATE productos_inventario
        SET stock_actual = stock_actual - p_cantidad
        WHERE id_producto = p_id_producto;
        
        RAISE NOTICE 'Salida registrada: % unidades', p_cantidad;
    ELSE
        RAISE EXCEPTION 'Stock insuficiente. Disponible: %, Solicitado: %', 
                        v_stock_actual, p_cantidad;
    END IF;
END;
$$;

-- 6. Función calcular_margen
CREATE OR REPLACE FUNCTION calcular_margen(p_id_producto INTEGER)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    v_margen DECIMAL;
BEGIN
    SELECT ((precio_venta - precio_compra) / precio_compra * 100)
    INTO v_margen
    FROM productos_inventario
    WHERE id_producto = p_id_producto;
    
    RETURN ROUND(v_margen, 2);
END;
$$;

-- 7. Función productos_bajo_stock
CREATE OR REPLACE FUNCTION productos_bajo_stock()
RETURNS TABLE (
    id INTEGER,
    nombre VARCHAR,
    stock_actual INTEGER,
    stock_minimo INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id_producto,
        p.nombre,
        p.stock_actual,
        p.stock_minimo
    FROM productos_inventario p
    WHERE p.stock_actual < p.stock_minimo;
END;
$$;

-- 8. EXPLAIN ANALYZE comparación
-- Consulta directa:
EXPLAIN ANALYZE 
SELECT * FROM productos_inventario WHERE stock_actual < stock_minimo;

-- Usando función:
EXPLAIN ANALYZE 
SELECT * FROM productos_bajo_stock();

-- 9. Procedimiento reporte de movimientos
CREATE OR REPLACE PROCEDURE reporte_movimientos(
    p_fecha_inicio DATE,
    p_fecha_fin DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT 
        p.nombre AS producto,
        SUM(CASE WHEN m.tipo = 'ENTRADA' THEN m.cantidad ELSE 0 END) AS total_entradas,
        SUM(CASE WHEN m.tipo = 'SALIDA' THEN m.cantidad ELSE 0 END) AS total_salidas,
        SUM(CASE WHEN m.tipo = 'ENTRADA' THEN m.cantidad ELSE -m.cantidad END) AS saldo
    FROM productos_inventario p
    LEFT JOIN movimientos m ON p.id_producto = m.id_producto
    WHERE m.fecha_movimiento BETWEEN p_fecha_inicio AND p_fecha_fin
    GROUP BY p.id_producto, p.nombre
    ORDER BY p.nombre;
END;
$$;

-- 10. Consultar índices no utilizados
SELECT 
    schemaname,
    tablename,
    indexname,
    idx_scan
FROM pg_stat_user_indexes
WHERE schemaname = 'public' AND idx_scan = 0
ORDER BY tablename, indexname;

-- Propuesta: Eliminar índices con idx_scan = 0 si no son necesarios
