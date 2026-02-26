-- =====================================================
-- PRÁCTICA: WINDOW FUNCTIONS con OVER
-- =====================================================

-- Promedio global con ventana
SELECT 
    titulo,
    reproducciones,
    AVG(reproducciones) OVER() AS promedio_global,
    reproducciones - AVG(reproducciones) OVER() AS diferencia_promedio
FROM canciones;

-- Suma acumulada
SELECT 
    titulo,
    fecha_lanzamiento,
    reproducciones,
    SUM(reproducciones) OVER(ORDER BY fecha_lanzamiento) AS reproducciones_acumuladas
FROM canciones
ORDER BY fecha_lanzamiento;

-- Particiones por artista
SELECT 
    a.nombre AS artista,
    c.titulo,
    c.reproducciones,
    AVG(c.reproducciones) OVER(PARTITION BY c.id_artista) AS promedio_artista,
    c.reproducciones - AVG(c.reproducciones) OVER(PARTITION BY c.id_artista) AS diferencia
FROM canciones c
JOIN artistas a ON c.id_artista = a.id_artista
ORDER BY a.nombre, c.reproducciones DESC;

-- Ranking dentro de particiones
SELECT 
    a.nombre AS artista,
    c.titulo,
    c.reproducciones,
    RANK() OVER(PARTITION BY c.id_artista ORDER BY c.reproducciones DESC) AS ranking_artista
FROM canciones c
JOIN artistas a ON c.id_artista = a.id_artista;

-- Ventana con rango de filas
SELECT 
    titulo,
    fecha_lanzamiento,
    reproducciones,
    AVG(reproducciones) OVER(
        ORDER BY fecha_lanzamiento 
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS promedio_movil
FROM canciones
ORDER BY fecha_lanzamiento;

-- Múltiples funciones de ventana
SELECT 
    titulo,
    reproducciones,
    MIN(reproducciones) OVER() AS min_global,
    MAX(reproducciones) OVER() AS max_global,
    AVG(reproducciones) OVER() AS avg_global,
    PERCENT_RANK() OVER(ORDER BY reproducciones) AS percentil
FROM canciones;
