-- =====================================================
-- SOLUCIONES EJERCICIO 2: Registro de Estudiantes
-- =====================================================

-- 1. Crear tabla estudiantes
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100),
    carrera VARCHAR(100),
    fecha_ingreso DATE,
    nota_media DECIMAL(3,2),
    creditos_completados INTEGER
);

-- 2. Insertar estudiantes (ver insert_data.sql)

-- 3. Extraer año y mes de ingreso
SELECT 
    nombre,
    apellidos,
    fecha_ingreso,
    EXTRACT(YEAR FROM fecha_ingreso) AS año_ingreso,
    EXTRACT(MONTH FROM fecha_ingreso) AS mes_ingreso
FROM estudiantes;

-- 4. Clasificar por nota media
SELECT 
    nombre,
    apellidos,
    nota_media,
    CASE 
        WHEN nota_media >= 9.0 THEN 'Sobresaliente'
        WHEN nota_media >= 7.0 THEN 'Notable'
        WHEN nota_media >= 5.0 THEN 'Aprobado'
        WHEN nota_media < 5.0 THEN 'Suspenso'
        ELSE 'Sin calificar'
    END AS clasificacion
FROM estudiantes;

-- 5. Contar estudiantes por carrera
SELECT carrera, COUNT(*) AS total_estudiantes
FROM estudiantes
GROUP BY carrera
ORDER BY total_estudiantes DESC;

-- 6. Carreras con nota media > 7.0
SELECT 
    carrera,
    ROUND(AVG(nota_media), 2) AS nota_media_carrera,
    COUNT(*) AS total_estudiantes
FROM estudiantes
WHERE nota_media IS NOT NULL
GROUP BY carrera
HAVING AVG(nota_media) > 7.0;

-- 7. Estudiante con más créditos
SELECT nombre, apellidos, creditos_completados
FROM estudiantes
WHERE creditos_completados = (SELECT MAX(creditos_completados) FROM estudiantes);

-- 8. Longitud del nombre completo
SELECT 
    nombre,
    apellidos,
    LENGTH(nombre || ' ' || apellidos) AS longitud_nombre_completo
FROM estudiantes
ORDER BY longitud_nombre_completo DESC;

-- 9. Carreras únicas
SELECT DISTINCT carrera FROM estudiantes ORDER BY carrera;

-- 10. Estudiantes sin nota media
SELECT 
    nombre,
    apellidos,
    carrera,
    COALESCE(CAST(nota_media AS VARCHAR), 'Pendiente de evaluación') AS nota
FROM estudiantes
WHERE nota_media IS NULL;
