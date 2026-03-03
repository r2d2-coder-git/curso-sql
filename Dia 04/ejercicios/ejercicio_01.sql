-- =====================================================
-- EJERCICIO 1: Sistema de Ventas Online
-- =====================================================

-- Asegurarse de usar el esquema dia04

-- 1. Crea las siguientes tablas:
--    
--    Tabla "clientes":
--    - id_cliente (entero, clave primaria, autoincremental)
--    - nombre (texto de máximo 100 caracteres)
--    - ciudad (texto de máximo 50 caracteres)
--    - pais (texto de máximo 50 caracteres)
--
--    Tabla "pedidos":
--    - id_pedido (entero, clave primaria, autoincremental)
--    - id_cliente (entero)
--    - fecha_pedido (fecha)
--    - total (decimal con 2 decimales)
--    - estado (texto: 'Pendiente', 'Enviado', 'Entregado')


-- 2. Inserta al menos 5 clientes y 10 pedidos


-- 3. Usa una SUBCONSULTA para encontrar los clientes que han gastado 
--    más que el promedio de todos los pedidos


-- 4. Usa WITH (CTE) para calcular el total gastado por cada cliente
--    y luego mostrar solo los que han gastado más de 500 euros


-- 5. Usa ROW_NUMBER para numerar los pedidos de cada cliente 
--    ordenados por fecha (del más reciente al más antiguo)


-- 6. Usa DENSE_RANK para rankear a los clientes por su gasto total


-- 7. Usa LAG para mostrar, para cada pedido, cuál fue el monto 
--    del pedido anterior del mismo cliente


-- 8. Crea una consulta PIVOT que muestre el total de ventas 
--    por país y por estado del pedido


-- 9. Usa una window function para calcular el porcentaje que representa
--    cada pedido sobre el total de ventas


-- 10. Combina CTE y window functions para encontrar el pedido más grande
--     de cada cliente y su posición en el ranking global
