-- =====================================================
-- EJERCICIO 2: Sistema de Inventario Avanzado
-- =====================================================

-- Asegurarse de usar el esquema dia06

-- 1. Crea las siguientes tablas:
--    
--    Tabla "proveedores":
--    - id_proveedor (entero, clave primaria, autoincremental)
--    - nombre (texto de máximo 100 caracteres)
--    - pais (texto de máximo 50 caracteres)
--
--    Tabla "productos_inventario":
--    - id_producto (entero, clave primaria, autoincremental)
--    - nombre (texto de máximo 100 caracteres)
--    - id_proveedor (entero, FK a proveedores)
--    - precio_compra (decimal con 2 decimales)
--    - precio_venta (decimal con 2 decimales)
--    - stock_actual (entero)
--    - stock_minimo (entero)
--
--    Tabla "movimientos":
--    - id_movimiento (entero, clave primaria, autoincremental)
--    - id_producto (entero, FK a productos_inventario)
--    - tipo (texto: 'ENTRADA' o 'SALIDA')
--    - cantidad (entero)
--    - fecha_movimiento (timestamp)


-- 2. Inserta al menos 4 proveedores, 10 productos y 20 movimientos


-- 3. Crea índices apropiados para optimizar consultas por:
--    - Búsquedas de productos por proveedor
--    - Búsquedas de movimientos por fecha
--    - Búsquedas de movimientos por producto y tipo


-- 4. Crea un procedimiento almacenado "registrar_entrada" que:
--    - Reciba: id_producto, cantidad
--    - Inserte un movimiento tipo 'ENTRADA'
--    - Actualice el stock_actual del producto


-- 5. Crea un procedimiento almacenado "registrar_salida" que:
--    - Reciba: id_producto, cantidad
--    - Verifique que hay stock suficiente
--    - Si hay stock: inserte movimiento 'SALIDA' y actualice stock
--    - Si no hay stock: lance una excepción


-- 6. Crea una función "calcular_margen" que reciba un id_producto
--    y retorne el porcentaje de margen de ganancia


-- 7. Crea una función "productos_bajo_stock" que retorne una tabla
--    con los productos cuyo stock_actual < stock_minimo


-- 8. Usa EXPLAIN ANALYZE para comparar estas dos consultas y determina cuál es más eficiente:
--    a) SELECT * FROM productos_inventario WHERE stock_actual < stock_minimo;
--    b) SELECT * FROM productos_bajo_stock();


-- 9. Crea un procedimiento que genere un reporte de movimientos:
--    - Reciba: fecha_inicio, fecha_fin
--    - Muestre: producto, total_entradas, total_salidas, saldo


-- 10. Consulta pg_stat_user_indexes para ver qué índices se están usando
--     y cuáles no, y propón eliminar los índices no utilizados
