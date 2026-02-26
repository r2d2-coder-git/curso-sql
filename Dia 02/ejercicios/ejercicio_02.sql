-- =====================================================
-- EJERCICIO 2: Sistema de Gestión de Empleados
-- =====================================================

-- 1. Crea una tabla llamada "empleados" con las siguientes columnas:
--    - id_empleado (entero, clave primaria, autoincremental)
--    - nombre_completo (texto de máximo 150 caracteres, no nulo)
--    - departamento (texto de máximo 50 caracteres)
--    - salario (decimal con 2 decimales)
--    - fecha_contratacion (fecha)
--    - activo (booleano, por defecto true)


-- 2. Inserta los siguientes empleados:
--    - Ana García López, Ventas, 28000.00, 2023-01-15, true
--    - Carlos Martínez Ruiz, IT, 35000.00, 2022-06-20, true
--    - Laura Fernández Soto, Marketing, 30000.00, 2023-03-10, true
--    - Miguel Ángel Torres, IT, 38000.00, 2021-11-05, true
--    - Isabel Romero Díaz, Recursos Humanos, 32000.00, 2023-07-01, false


-- 3. Selecciona todos los empleados del departamento "IT"


-- 4. Selecciona nombre y salario de empleados con salario superior a 30000


-- 5. Actualiza el salario de "Ana García López" a 30000.00


-- 6. Selecciona empleados cuyos nombres empiecen con "L"


-- 7. Selecciona empleados de los departamentos "IT" o "Marketing"


-- 8. Actualiza el estado "activo" a true para "Isabel Romero Díaz"


-- 9. Selecciona los 2 empleados con mayor salario


-- 10. Añade un comentario explicando qué hace la siguiente consulta:

SELECT nombre_completo AS empleado, departamento AS area
FROM empleados
WHERE activo = true AND salario > 30000
ORDER BY salario DESC
LIMIT 5;
