-- =====================================================
-- EJERCICIO 2: Sistema de Registro de Estudiantes
-- =====================================================

-- Asegurarse de usar el esquema dia03

-- 1. Crea una tabla "estudiantes" con las siguientes columnas:
--    - id_estudiante (entero, clave primaria, autoincremental)
--    - nombre (texto de máximo 100 caracteres, no nulo)
--    - apellidos (texto de máximo 100 caracteres)
--    - carrera (texto de máximo 100 caracteres)
--    - fecha_ingreso (fecha)
--    - nota_media (decimal con 2 decimales, puede ser nulo)
--    - creditos_completados (entero)


-- 2. Inserta al menos 10 estudiantes con diferentes carreras y fechas de ingreso


-- 3. Extrae el año y mes de ingreso de cada estudiante


-- 4. Clasifica a los estudiantes según su nota media:
--    - 9.0 o más: "Sobresaliente"
--    - 7.0 a 8.9: "Notable"
--    - 5.0 a 6.9: "Aprobado"
--    - Menos de 5.0: "Suspenso"
--    - NULL: "Sin calificar"


-- 5. Cuenta cuántos estudiantes hay en cada carrera


-- 6. Muestra las carreras donde la nota media de los estudiantes es superior a 7.0


-- 7. Encuentra el estudiante con más créditos completados


-- 8. Calcula la longitud del nombre completo (nombre + apellidos) de cada estudiante


-- 9. Lista todas las carreras únicas disponibles


-- 10. Muestra los estudiantes que no tienen nota media asignada (NULL)
--     y reemplaza el NULL con el texto "Pendiente de evaluación"
