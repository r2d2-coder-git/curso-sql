-- =====================================================
-- PRÁCTICA: WITH (Common Table Expressions - CTE)
-- =====================================================

-- CTE simple
WITH stats_artista AS (
    SELECT 
        id_artista,
        COUNT(*) AS total_canciones,
        AVG(reproducciones) AS promedio_reproducciones,
        SUM(reproducciones) AS total_reproducciones
    FROM canciones
    GROUP BY id_artista
)
SELECT 
    a.nombre,
    s.total_canciones,
    s.promedio_reproducciones,
    s.total_reproducciones
FROM artistas a
JOIN stats_artista s ON a.id_artista = s.id_artista
ORDER BY s.total_reproducciones DESC;

-- Múltiples CTEs
WITH 
top_canciones AS (
    SELECT * FROM canciones WHERE reproducciones > 400000000
),
artistas_top AS (
    SELECT DISTINCT id_artista FROM top_canciones
)
SELECT a.nombre, COUNT(t.id_cancion) AS canciones_exitosas
FROM artistas a
JOIN artistas_top at ON a.id_artista = at.id_artista
JOIN top_canciones t ON a.id_artista = t.id_artista
GROUP BY a.nombre;

-- CTE recursivo (ejemplo: jerarquía)
WITH RECURSIVE numeros AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numeros WHERE n < 10
)
SELECT * FROM numeros;

-- CTE para cálculos complejos
WITH 
promedio_global AS (
    SELECT AVG(reproducciones) AS promedio FROM canciones
),
canciones_populares AS (
    SELECT c.*, p.promedio
    FROM canciones c, promedio_global p
    WHERE c.reproducciones > p.promedio
)
SELECT 
    a.nombre AS artista,
    cp.titulo,
    cp.reproducciones,
    ROUND((cp.reproducciones / cp.promedio) * 100, 2) AS porcentaje_vs_promedio
FROM canciones_populares cp
JOIN artistas a ON cp.id_artista = a.id_artista
ORDER BY porcentaje_vs_promedio DESC;
