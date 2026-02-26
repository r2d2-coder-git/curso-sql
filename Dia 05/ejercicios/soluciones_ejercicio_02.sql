-- =====================================================
-- SOLUCIONES EJERCICIO 2: Sistema Universitario
-- =====================================================

-- 1. Crear tablas (ver insert_data.sql)

-- 2. Insertar datos (ver insert_data.sql)

-- 3. Constraint para notas
ALTER TABLE matriculas 
ADD CONSTRAINT check_nota CHECK (nota IS NULL OR (nota >= 0 AND nota <= 10));

-- 4. INNER JOIN: Matrículas completas
SELECT 
    e.nombre AS estudiante,
    a.nombre AS asignatura,
    p.nombre AS profesor,
    m.nota
FROM matriculas m
INNER JOIN estudiantes e ON m.id_estudiante = e.id_estudiante
INNER JOIN asignaturas a ON m.id_asignatura = a.id_asignatura
INNER JOIN profesores p ON a.id_profesor = p.id_profesor
ORDER BY e.nombre, a.nombre;

-- 5. LEFT JOIN: Profesores y asignaturas
SELECT 
    p.nombre AS profesor,
    p.departamento,
    COUNT(a.id_asignatura) AS total_asignaturas
FROM profesores p
LEFT JOIN asignaturas a ON p.id_profesor = a.id_profesor
GROUP BY p.id_profesor, p.nombre, p.departamento;

-- 6. LEFT JOIN: Estudiantes sin matrículas
SELECT e.nombre, e.carrera
FROM estudiantes e
LEFT JOIN matriculas m ON e.id_estudiante = m.id_estudiante
WHERE m.id_matricula IS NULL;

-- 7. Nota media por asignatura
SELECT 
    a.nombre AS asignatura,
    p.nombre AS profesor,
    ROUND(AVG(m.nota), 2) AS nota_media,
    COUNT(m.id_matricula) AS total_estudiantes
FROM asignaturas a
INNER JOIN profesores p ON a.id_profesor = p.id_profesor
LEFT JOIN matriculas m ON a.id_asignatura = m.id_asignatura
WHERE m.nota IS NOT NULL
GROUP BY a.id_asignatura, a.nombre, p.nombre
ORDER BY nota_media DESC;

-- 8. Profesor con mejor nota media
SELECT 
    p.nombre AS profesor,
    p.departamento,
    ROUND(AVG(m.nota), 2) AS nota_media_estudiantes
FROM profesores p
INNER JOIN asignaturas a ON p.id_profesor = a.id_profesor
INNER JOIN matriculas m ON a.id_asignatura = m.id_asignatura
WHERE m.nota IS NOT NULL
GROUP BY p.id_profesor, p.nombre, p.departamento
ORDER BY nota_media_estudiantes DESC
LIMIT 1;

-- 9. UNION ALL: Listado de nombres
SELECT nombre, 'Profesor' AS tipo FROM profesores
UNION ALL
SELECT nombre, 'Estudiante' AS tipo FROM estudiantes
ORDER BY tipo, nombre;

-- 10. Resumen por estudiante
SELECT 
    e.nombre AS estudiante,
    e.carrera,
    SUM(a.creditos) AS creditos_matriculados,
    ROUND(AVG(m.nota), 2) AS nota_media,
    COUNT(CASE WHEN m.nota >= 5 THEN 1 END) AS asignaturas_aprobadas,
    COUNT(m.id_matricula) AS total_asignaturas
FROM estudiantes e
LEFT JOIN matriculas m ON e.id_estudiante = m.id_estudiante
LEFT JOIN asignaturas a ON m.id_asignatura = a.id_asignatura
GROUP BY e.id_estudiante, e.nombre, e.carrera
ORDER BY nota_media DESC NULLS LAST;
