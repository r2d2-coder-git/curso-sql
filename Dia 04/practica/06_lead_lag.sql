-- =====================================================
-- PRÁCTICA: LEAD y LAG
-- =====================================================

-- LAG: Acceder al valor de la fila ANTERIOR
SELECT 
    titulo,
    fecha_lanzamiento,
    reproducciones,
    LAG(reproducciones) OVER(ORDER BY fecha_lanzamiento) AS reproducciones_anterior,
    reproducciones - LAG(reproducciones) OVER(ORDER BY fecha_lanzamiento) AS diferencia
FROM canciones
ORDER BY fecha_lanzamiento;

-- LEAD: Acceder al valor de la fila SIGUIENTE
SELECT 
    titulo,
    fecha_lanzamiento,
    reproducciones,
    LEAD(reproducciones) OVER(ORDER BY fecha_lanzamiento) AS reproducciones_siguiente
FROM canciones
ORDER BY fecha_lanzamiento;

-- Comparar con anterior y siguiente
SELECT 
    titulo,
    reproducciones,
    LAG(reproducciones) OVER(ORDER BY fecha_lanzamiento) AS anterior,
    LEAD(reproducciones) OVER(ORDER BY fecha_lanzamiento) AS siguiente,
    reproducciones - LAG(reproducciones) OVER(ORDER BY fecha_lanzamiento) AS cambio_vs_anterior
FROM canciones
ORDER BY fecha_lanzamiento;

-- LAG y LEAD por artista
SELECT 
    a.nombre AS artista,
    c.titulo,
    c.fecha_lanzamiento,
    c.reproducciones,
    LAG(c.titulo) OVER(PARTITION BY c.id_artista ORDER BY c.fecha_lanzamiento) AS cancion_anterior,
    LEAD(c.titulo) OVER(PARTITION BY c.id_artista ORDER BY c.fecha_lanzamiento) AS cancion_siguiente
FROM canciones c
JOIN artistas a ON c.id_artista = a.id_artista
ORDER BY a.nombre, c.fecha_lanzamiento;

-- LAG con valor por defecto
SELECT 
    titulo,
    reproducciones,
    LAG(reproducciones, 1, 0) OVER(ORDER BY fecha_lanzamiento) AS anterior
FROM canciones;

-- LAG con offset mayor
SELECT 
    titulo,
    fecha_lanzamiento,
    LAG(titulo, 2) OVER(ORDER BY fecha_lanzamiento) AS dos_canciones_atras
FROM canciones
ORDER BY fecha_lanzamiento;
