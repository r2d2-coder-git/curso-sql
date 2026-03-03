-- =====================================================
-- SOLUCIONES EJERCICIO 2: Rendimiento de Empleados
-- =====================================================

-- 1 y 2. Crear tablas e insertar datos (ver insert_data.sql)

-- 3. Empleados con ventas superiores al promedio de su departamento
SELECT 
    e.nombre,
    e.ventas_mes,
    d.nombre_departamento
FROM dia04.empleados_ventas e
JOIN dia04.departamentos d ON e.id_departamento = d.id_departamento
WHERE e.ventas_mes > (
    SELECT AVG(e2.ventas_mes)
    FROM dia04.empleados_ventas e2
    WHERE e2.id_departamento = e.id_departamento
);

-- 4. CTE: Ventas totales vs presupuesto
WITH ventas_dept AS (
    SELECT 
        d.nombre_departamento,
        d.presupuesto,
        SUM(e.ventas_mes) AS ventas_totales
    FROM dia04.departamentos d
    JOIN dia04.empleados_ventas e ON d.id_departamento = e.id_departamento
    GROUP BY d.id_departamento, d.nombre_departamento, d.presupuesto
)
SELECT 
    nombre_departamento,
    presupuesto,
    ventas_totales,
    ventas_totales - presupuesto AS diferencia
FROM ventas_dept;

-- 5. ROW_NUMBER por departamento
SELECT 
    d.nombre_departamento,
    e.nombre,
    e.ventas_mes,
    ROW_NUMBER() OVER(PARTITION BY e.id_departamento ORDER BY e.ventas_mes DESC) AS num_empleado
FROM dia04.empleados_ventas e
JOIN dia04.departamentos d ON e.id_departamento = d.id_departamento;

-- 6. DENSE_RANK global
SELECT 
    nombre,
    ventas_mes,
    DENSE_RANK() OVER(ORDER BY ventas_mes DESC) AS ranking_global
FROM dia04.empleados_ventas;

-- 7. LEAD: Ventas del siguiente empleado
SELECT 
    d.nombre_departamento,
    e.nombre,
    e.ventas_mes,
    LEAD(e.ventas_mes) OVER(PARTITION BY e.id_departamento ORDER BY e.ventas_mes DESC) AS ventas_siguiente
FROM dia04.empleados_ventas e
JOIN dia04.departamentos d ON e.id_departamento = d.id_departamento;

-- 8. Diferencia vs promedio departamento
SELECT 
    e.nombre,
    e.ventas_mes,
    AVG(e.ventas_mes) OVER(PARTITION BY e.id_departamento) AS promedio_dept,
    e.ventas_mes - AVG(e.ventas_mes) OVER(PARTITION BY e.id_departamento) AS diferencia
FROM dia04.empleados_ventas e;

-- 9. PIVOT: Ventas por departamento y año
SELECT 
    d.nombre_departamento,
    SUM(CASE WHEN EXTRACT(YEAR FROM e.fecha_contratacion) = 2019 THEN e.ventas_mes ELSE 0 END) AS "2019",
    SUM(CASE WHEN EXTRACT(YEAR FROM e.fecha_contratacion) = 2020 THEN e.ventas_mes ELSE 0 END) AS "2020",
    SUM(CASE WHEN EXTRACT(YEAR FROM e.fecha_contratacion) = 2021 THEN e.ventas_mes ELSE 0 END) AS "2021",
    SUM(CASE WHEN EXTRACT(YEAR FROM e.fecha_contratacion) = 2022 THEN e.ventas_mes ELSE 0 END) AS "2022"
FROM dia04.departamentos d
LEFT JOIN dia04.empleados_ventas e ON d.id_departamento = e.id_departamento
GROUP BY d.nombre_departamento;

-- 10. Múltiples CTEs
WITH top3_por_dept AS (
    SELECT 
        id_departamento,
        nombre,
        ventas_mes,
        ROW_NUMBER() OVER(PARTITION BY id_departamento ORDER BY ventas_mes DESC) AS rank
    FROM dia04.empleados_ventas
),
promedio_top3 AS (
    SELECT 
        id_departamento,
        AVG(ventas_mes) AS promedio_top3
    FROM top3_por_dept
    WHERE rank <= 3
    GROUP BY id_departamento
)
SELECT 
    d.nombre_departamento,
    p.promedio_top3
FROM dia04.departamentos d
JOIN promedio_top3 p ON d.id_departamento = p.id_departamento
WHERE p.promedio_top3 > 5000;
