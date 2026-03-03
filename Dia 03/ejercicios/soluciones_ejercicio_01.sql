-- =====================================================
-- SOLUCIONES EJERCICIO 1: Gestión de Películas
-- =====================================================

-- 1. Crear tabla peliculas
CREATE TABLE dia03.peliculas (
    id_pelicula SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100),
    genero VARCHAR(50),
    duracion_minutos INTEGER,
    fecha_estreno DATE,
    calificacion DECIMAL(2,1),
    recaudacion_millones DECIMAL(8,2)
);

-- 2. Insertar películas (ver insert_data.sql)

-- 3. Películas estrenadas en 2023
SELECT * FROM dia03.peliculas 
WHERE EXTRACT(YEAR FROM fecha_estreno) = 2023;

-- 4. Años desde el estreno
SELECT 
    titulo,
    fecha_estreno,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_estreno)) AS años_desde_estreno,
    CURRENT_DATE - fecha_estreno AS dias_desde_estreno
FROM dia03.peliculas;

-- 5. Clasificar por duración
SELECT 
    titulo,
    duracion_minutos,
    CASE 
        WHEN duracion_minutos < 90 THEN 'Corta'
        WHEN duracion_minutos BETWEEN 90 AND 150 THEN 'Media'
        ELSE 'Larga'
    END AS clasificacion_duracion
FROM dia03.peliculas;

-- 6. Contar películas por género
SELECT genero, COUNT(*) AS total_peliculas
FROM dia03.peliculas
GROUP BY genero
ORDER BY total_peliculas DESC;

-- 7. Géneros con más de 2 películas
SELECT genero, COUNT(*) AS total
FROM dia03.peliculas
GROUP BY genero
HAVING COUNT(*) > 2;

-- 8. Película con mayor y menor calificación
SELECT 'Mayor calificación' AS tipo, titulo, calificacion
FROM dia03.peliculas
WHERE calificacion = (SELECT MAX(calificacion) FROM dia03.peliculas)
UNION ALL
SELECT 'Menor calificación' AS tipo, titulo, calificacion
FROM dia03.peliculas
WHERE calificacion = (SELECT MIN(calificacion) FROM dia03.peliculas);

-- 9. Recaudación promedio por género (manejando NULL)
SELECT 
    genero,
    COUNT(*) AS total_peliculas,
    ROUND(AVG(COALESCE(recaudacion_millones, 0)), 2) AS recaudacion_promedio,
    COUNT(recaudacion_millones) AS peliculas_con_datos
FROM dia03.peliculas
GROUP BY genero;

-- 10. Ordenar por fecha y calificación
SELECT titulo, fecha_estreno, calificacion
FROM dia03.peliculas
ORDER BY fecha_estreno DESC, calificacion DESC;
