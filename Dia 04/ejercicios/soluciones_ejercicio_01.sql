-- =====================================================
-- SOLUCIONES EJERCICIO 1: Ventas Online
-- =====================================================

-- 1 y 2. Crear tablas e insertar datos (ver insert_data.sql)

-- 3. Clientes que han gastado más que el promedio
SELECT c.nombre, SUM(p.total) AS gasto_total
FROM dia04.clientes c
JOIN dia04.pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING SUM(p.total) > (SELECT AVG(total) FROM dia04.pedidos);

-- 4. CTE: Clientes que han gastado más de 500
WITH gasto_clientes AS (
    SELECT 
        c.id_cliente,
        c.nombre,
        SUM(p.total) AS gasto_total
    FROM dia04.clientes c
    JOIN dia04.pedidos p ON c.id_cliente = p.id_cliente
    GROUP BY c.id_cliente, c.nombre
)
SELECT nombre, gasto_total
FROM gasto_clientes
WHERE gasto_total > 500;

-- 5. ROW_NUMBER: Numerar pedidos por cliente
SELECT 
    c.nombre AS cliente,
    p.fecha_pedido,
    p.total,
    ROW_NUMBER() OVER(PARTITION BY p.id_cliente ORDER BY p.fecha_pedido DESC) AS num_pedido
FROM dia04.pedidos p
JOIN dia04.clientes c ON p.id_cliente = c.id_cliente;

-- 6. DENSE_RANK: Rankear clientes por gasto
WITH gasto_total AS (
    SELECT 
        c.nombre,
        SUM(p.total) AS total_gastado
    FROM dia04.clientes c
    JOIN dia04.pedidos p ON c.id_cliente = p.id_cliente
    GROUP BY c.id_cliente, c.nombre
)
SELECT 
    nombre,
    total_gastado,
    DENSE_RANK() OVER(ORDER BY total_gastado DESC) AS ranking
FROM gasto_total;

-- 7. LAG: Monto del pedido anterior
SELECT 
    c.nombre AS cliente,
    p.fecha_pedido,
    p.total,
    LAG(p.total) OVER(PARTITION BY p.id_cliente ORDER BY p.fecha_pedido) AS pedido_anterior
FROM dia04.pedidos p
JOIN dia04.clientes c ON p.id_cliente = c.id_cliente
ORDER BY c.nombre, p.fecha_pedido;

-- 8. PIVOT: Ventas por país y estado
SELECT 
    c.pais,
    SUM(CASE WHEN p.estado = 'Pendiente' THEN p.total ELSE 0 END) AS Pendiente,
    SUM(CASE WHEN p.estado = 'Enviado' THEN p.total ELSE 0 END) AS Enviado,
    SUM(CASE WHEN p.estado = 'Entregado' THEN p.total ELSE 0 END) AS Entregado
FROM dia04.clientes c
JOIN dia04.pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.pais;

-- 9. Porcentaje sobre total de ventas
SELECT 
    p.id_pedido,
    p.total,
    ROUND((p.total / SUM(p.total) OVER()) * 100, 2) AS porcentaje_total
FROM dia04.pedidos p;

-- 10. CTE + Window: Pedido más grande por cliente y ranking global
WITH pedidos_ranking AS (
    SELECT 
        c.nombre AS cliente,
        p.total,
        ROW_NUMBER() OVER(PARTITION BY p.id_cliente ORDER BY p.total DESC) AS rank_cliente,
        DENSE_RANK() OVER(ORDER BY p.total DESC) AS rank_global
    FROM dia04.pedidos p
    JOIN dia04.clientes c ON p.id_cliente = c.id_cliente
)
SELECT cliente, total, rank_global
FROM pedidos_ranking
WHERE rank_cliente = 1
ORDER BY rank_global;
