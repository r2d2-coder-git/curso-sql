-- =====================================================
-- PRÁCTICA: STORED PROCEDURES
-- =====================================================

-- Procedimiento simple
CREATE OR REPLACE PROCEDURE actualizar_stock(
    p_id_producto INTEGER,
    p_cantidad INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE productos_tienda 
    SET stock = stock - p_cantidad 
    WHERE id_producto = p_id_producto;
    
    RAISE NOTICE 'Stock actualizado para producto %', p_id_producto;
END;
$$;

-- Llamar al procedimiento
CALL actualizar_stock(1, 5);

-- Procedimiento con lógica condicional
CREATE OR REPLACE PROCEDURE registrar_venta(
    p_id_producto INTEGER,
    p_cantidad INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_stock_actual INTEGER;
    v_precio DECIMAL(8,2);
    v_total DECIMAL(10,2);
BEGIN
    -- Verificar stock
    SELECT stock, precio INTO v_stock_actual, v_precio
    FROM productos_tienda
    WHERE id_producto = p_id_producto;
    
    IF v_stock_actual >= p_cantidad THEN
        v_total := v_precio * p_cantidad;
        
        INSERT INTO ventas_online (id_producto, cantidad, fecha_venta, total)
        VALUES (p_id_producto, p_cantidad, NOW(), v_total);
        
        UPDATE productos_tienda 
        SET stock = stock - p_cantidad 
        WHERE id_producto = p_id_producto;
        
        RAISE NOTICE 'Venta registrada';
    ELSE
        RAISE EXCEPTION 'Stock insuficiente';
    END IF;
END;
$$;

-- Procedimiento con transacción
CREATE OR REPLACE PROCEDURE transferir_stock(
    p_id_origen INTEGER,
    p_id_destino INTEGER,
    p_cantidad INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE productos_tienda 
    SET stock = stock - p_cantidad 
    WHERE id_producto = p_id_origen;
    
    UPDATE productos_tienda 
    SET stock = stock + p_cantidad 
    WHERE id_producto = p_id_destino;
    
    COMMIT;
END;
$$;

-- Ver procedimientos creados
SELECT routine_name, routine_type
FROM information_schema.routines
WHERE routine_schema = 'public' AND routine_type = 'PROCEDURE';

-- Eliminar procedimiento
-- DROP PROCEDURE actualizar_stock;
