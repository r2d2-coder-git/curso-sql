-- =====================================================
-- EJERCICIO 2: Análisis de Rendimiento de Empleados
-- =====================================================

-- 1. Crea las siguientes tablas:
--    
--    Tabla "departamentos":
--    - id_departamento (entero, clave primaria, autoincremental)
--    - nombre_departamento (texto de máximo 50 caracteres)
--    - presupuesto (decimal con 2 decimales)
--
--    Tabla "empleados_ventas":
--    - id_empleado (entero, clave primaria, autoincremental)
--    - nombre (texto de máximo 100 caracteres)
--    - id_departamento (entero)
--    - fecha_contratacion (fecha)
--    - ventas_mes (decimal con 2 decimales)


-- 2. Inserta al menos 3 departamentos y 12 empleados


-- 3. Usa una SUBCONSULTA para encontrar empleados cuyas ventas 
--    superan el promedio de su departamento


-- 4. Usa WITH para crear una tabla temporal con las ventas totales
--    por departamento y luego compararlas con el presupuesto


-- 5. Usa ROW_NUMBER para asignar un número de empleado dentro 
--    de cada departamento ordenado por ventas descendentes


-- 6. Usa DENSE_RANK para rankear empleados por ventas a nivel global


-- 7. Usa LEAD para mostrar las ventas del siguiente empleado 
--    (ordenado por ventas) en cada departamento


-- 8. Calcula la diferencia entre las ventas de cada empleado 
--    y el promedio de su departamento usando window functions


-- 9. Crea un PIVOT que muestre las ventas totales por departamento
--    y por año de contratación


-- 10. Usa múltiples CTEs para:
--     a) Calcular el top 3 de empleados por departamento
--     b) Calcular el promedio de ventas de estos top 3
--     c) Mostrar qué departamentos tienen un promedio superior a 5000
