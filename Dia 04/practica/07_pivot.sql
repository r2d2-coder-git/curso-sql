-- =====================================================
-- PRÁCTICA: PIVOT (Transposición de tablas)
-- PostgreSQL no tiene PIVOT nativo, usamos CASE WHEN
-- =====================================================

-- Crear vista de reproducciones por artista y año
SELECT 
    a.nombre AS artista,
    SUM(CASE WHEN EXTRACT(YEAR FROM c.fecha_lanzamiento) = 2018 THEN c.reproducciones ELSE 0 END) AS "2018",
    SUM(CASE WHEN EXTRACT(YEAR FROM c.fecha_lanzamiento) = 2020 THEN c.reproducciones ELSE 0 END) AS "2020",
    SUM(CASE WHEN EXTRACT(YEAR FROM c.fecha_lanzamiento) = 2021 THEN c.reproducciones ELSE 0 END) AS "2021",
    SUM(CASE WHEN EXTRACT(YEAR FROM c.fecha_lanzamiento) = 2022 THEN c.reproducciones ELSE 0 END) AS "2022",
    SUM(CASE WHEN EXTRACT(YEAR FROM c.fecha_lanzamiento) = 2023 THEN c.reproducciones ELSE 0 END) AS "2023"
FROM artistas a
LEFT JOIN canciones c ON a.id_artista = c.id_artista
GROUP BY a.nombre
ORDER BY a.nombre;

-- Pivot de canciones por rango de duración
SELECT 
    a.nombre AS artista,
    COUNT(CASE WHEN c.duracion_segundos < 180 THEN 1 END) AS "Cortas (<3min)",
    COUNT(CASE WHEN c.duracion_segundos BETWEEN 180 AND 240 THEN 1 END) AS "Medias (3-4min)",
    COUNT(CASE WHEN c.duracion_segundos > 240 THEN 1 END) AS "Largas (>4min)"
FROM artistas a
LEFT JOIN canciones c ON a.id_artista = c.id_artista
GROUP BY a.nombre;

-- Pivot de reproducciones por rango
SELECT 
    EXTRACT(YEAR FROM fecha_lanzamiento) AS año,
    SUM(CASE WHEN reproducciones < 400000000 THEN 1 ELSE 0 END) AS "Menos de 400M",
    SUM(CASE WHEN reproducciones BETWEEN 400000000 AND 500000000 THEN 1 ELSE 0 END) AS "400M-500M",
    SUM(CASE WHEN reproducciones > 500000000 THEN 1 ELSE 0 END) AS "Más de 500M"
FROM canciones
GROUP BY EXTRACT(YEAR FROM fecha_lanzamiento)
ORDER BY año;

-- Pivot con promedios
SELECT 
    a.genero_principal,
    ROUND(AVG(CASE WHEN EXTRACT(YEAR FROM c.fecha_lanzamiento) = 2021 THEN c.reproducciones END), 0) AS "Promedio 2021",
    ROUND(AVG(CASE WHEN EXTRACT(YEAR FROM c.fecha_lanzamiento) = 2022 THEN c.reproducciones END), 0) AS "Promedio 2022"
FROM artistas a
LEFT JOIN canciones c ON a.id_artista = c.id_artista
GROUP BY a.genero_principal;
