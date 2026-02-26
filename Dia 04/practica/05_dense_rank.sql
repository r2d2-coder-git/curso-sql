-- =====================================================
-- PRÁCTICA: DENSE_RANK vs RANK
-- =====================================================

-- Comparación entre ROW_NUMBER, RANK y DENSE_RANK
SELECT 
    titulo,
    reproducciones,
    ROW_NUMBER() OVER(ORDER BY reproducciones DESC) AS row_num,
    RANK() OVER(ORDER BY reproducciones DESC) AS rank,
    DENSE_RANK() OVER(ORDER BY reproducciones DESC) AS dense_rank
FROM canciones;

/*
DIFERENCIAS:
- ROW_NUMBER: Siempre único, incluso con empates (1,2,3,4,5...)
- RANK: Con empates salta números (1,2,2,4,5...)
- DENSE_RANK: Con empates NO salta números (1,2,2,3,4...)
*/

-- DENSE_RANK por reproducciones
SELECT 
    titulo,
    reproducciones,
    DENSE_RANK() OVER(ORDER BY reproducciones DESC) AS ranking
FROM canciones;

-- DENSE_RANK por artista
SELECT 
    a.nombre AS artista,
    c.titulo,
    c.reproducciones,
    DENSE_RANK() OVER(PARTITION BY c.id_artista ORDER BY c.reproducciones DESC) AS ranking
FROM canciones c
JOIN artistas a ON c.id_artista = a.id_artista;

-- Top 3 canciones usando DENSE_RANK
WITH ranking AS (
    SELECT 
        titulo,
        reproducciones,
        DENSE_RANK() OVER(ORDER BY reproducciones DESC) AS rank
    FROM canciones
)
SELECT titulo, reproducciones, rank
FROM ranking
WHERE rank <= 3;

-- Ejemplo práctico: Clasificación de canciones por popularidad
SELECT 
    titulo,
    reproducciones,
    CASE 
        WHEN DENSE_RANK() OVER(ORDER BY reproducciones DESC) <= 2 THEN 'Mega Hit'
        WHEN DENSE_RANK() OVER(ORDER BY reproducciones DESC) <= 4 THEN 'Hit'
        ELSE 'Popular'
    END AS categoria
FROM canciones;
