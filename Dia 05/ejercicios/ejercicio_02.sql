-- =====================================================
-- EJERCICIO 2: Sistema de Gestión Universitaria
-- =====================================================

-- Asegurarse de usar el esquema dia05

-- 1. Crea las siguientes tablas con sus relaciones:
--
--    Tabla "profesores":
--    - id_profesor (PK, autoincremental)
--    - nombre (texto, no nulo)
--    - departamento (texto)
--    - email (texto, único)
--
--    Tabla "asignaturas":
--    - id_asignatura (PK, autoincremental)
--    - nombre (texto, no nulo)
--    - creditos (entero)
--    - id_profesor (FK a profesores)
--
--    Tabla "estudiantes":
--    - id_estudiante (PK, autoincremental)
--    - nombre (texto, no nulo)
--    - carrera (texto)
--    - año_ingreso (entero)
--
--    Tabla "matriculas":
--    - id_matricula (PK, autoincremental)
--    - id_estudiante (FK a estudiantes)
--    - id_asignatura (FK a asignaturas)
--    - nota (decimal, puede ser nulo)
--    - fecha_matricula (fecha)


-- 2. Inserta datos de ejemplo (al menos 4 profesores, 6 asignaturas, 8 estudiantes, 15 matrículas)


-- 3. Agrega un CONSTRAINT para que la nota esté entre 0 y 10


-- 4. Usa INNER JOIN para listar todas las matrículas con nombre del estudiante,
--    nombre de la asignatura y nombre del profesor


-- 5. Usa LEFT JOIN para mostrar todos los profesores y cuántas asignaturas imparten


-- 6. Usa LEFT JOIN para encontrar estudiantes que no están matriculados en ninguna asignatura


-- 7. Calcula la nota media de cada asignatura usando JOINs y GROUP BY


-- 8. Encuentra qué profesor tiene estudiantes con la nota media más alta


-- 9. Usa UNION ALL para crear un listado combinado de todos los nombres
--    (profesores, estudiantes) con una columna que indique el tipo


-- 10. Crea una consulta que muestre, para cada estudiante:
--     - Nombre del estudiante
--     - Total de créditos matriculados
--     - Nota media
--     - Número de asignaturas aprobadas (nota >= 5)
