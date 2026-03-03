-- =====================================================
-- SOLUCIONES EJERCICIO 2: Gestión de Empleados
-- =====================================================

-- 1. Crear tabla empleados
CREATE TABLE dia02.empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    activo BOOLEAN DEFAULT true
);

-- 2. Insertar empleados
INSERT INTO dia02.empleados (nombre_completo, departamento, salario, fecha_contratacion, activo) VALUES
    ('Ana García López', 'Ventas', 28000.00, '2023-01-15', true),
    ('Carlos Martínez Ruiz', 'IT', 35000.00, '2022-06-20', true),
    ('Laura Fernández Soto', 'Marketing', 30000.00, '2023-03-10', true),
    ('Miguel Ángel Torres', 'IT', 38000.00, '2021-11-05', true),
    ('Isabel Romero Díaz', 'Recursos Humanos', 32000.00, '2023-07-01', false);

-- 3. Empleados del departamento IT
SELECT * FROM dia02.empleados WHERE departamento = 'IT';

-- 4. Nombre y salario de empleados con salario > 30000
SELECT nombre_completo, salario FROM dia02.empleados WHERE salario > 30000;

-- 5. Actualizar salario de Ana García
UPDATE dia02.empleados SET salario = 30000.00 WHERE nombre_completo = 'Ana García López';

-- 6. Empleados cuyos nombres empiezan con L
SELECT * FROM dia02.empleados WHERE nombre_completo LIKE 'L%';

-- 7. Empleados de IT o Marketing
SELECT * FROM dia02.empleados WHERE departamento IN ('IT', 'Marketing');

-- 8. Actualizar estado activo de Isabel
UPDATE dia02.empleados SET activo = true WHERE nombre_completo = 'Isabel Romero Díaz';

-- 9. Eliminar empleados con activo = false
DELETE FROM dia02.empleados WHERE activo = false;

-- 10. Eliminar empleados de Recursos Humanos y ver los eliminados
DELETE FROM dia02.empleados WHERE departamento = 'Recursos Humanos' RETURNING *;

-- 11. Los 2 empleados con mayor salario
SELECT * FROM dia02.empleados ORDER BY salario DESC LIMIT 2;

-- 12. Consulta con comentario
-- Esta consulta selecciona empleados activos con salario superior a 30000,
-- mostrando su nombre y departamento, ordenados por salario descendente,
-- limitando los resultados a los 5 mejores pagados
SELECT nombre_completo AS empleado, departamento AS area
FROM dia02.empleados
WHERE activo = true AND salario > 30000
ORDER BY salario DESC
LIMIT 5;
