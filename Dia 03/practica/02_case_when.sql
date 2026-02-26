-- =====================================================
-- PRÁCTICA: CASE WHEN
-- =====================================================

-- Clasificar juegos por precio
SELECT 
    titulo,
    precio,
    CASE 
        WHEN precio < 30 THEN 'Económico'
        WHEN precio BETWEEN 30 AND 55 THEN 'Precio Medio'
        ELSE 'Premium'
    END AS categoria_precio
FROM videojuegos;

-- Clasificar por puntuación
SELECT 
    titulo,
    puntuacion,
    CASE 
        WHEN puntuacion >= 9.0 THEN 'Obra Maestra'
        WHEN puntuacion >= 8.0 THEN 'Excelente'
        WHEN puntuacion >= 7.0 THEN 'Bueno'
        WHEN puntuacion >= 5.0 THEN 'Regular'
        ELSE 'Malo'
    END AS calificacion
FROM videojuegos;

-- CASE con múltiples condiciones
SELECT 
    titulo,
    precio,
    puntuacion,
    CASE 
        WHEN precio > 60 AND puntuacion >= 9.0 THEN 'Premium de Calidad'
        WHEN precio < 30 AND puntuacion >= 8.0 THEN 'Ganga'
        WHEN precio > 60 AND puntuacion < 7.0 THEN 'Sobrevalorado'
        ELSE 'Normal'
    END AS valoracion
FROM videojuegos;

-- CASE para calcular descuentos
SELECT 
    titulo,
    precio,
    CASE 
        WHEN genero = 'Deportes' THEN precio * 0.8
        WHEN genero = 'RPG' THEN precio * 0.9
        ELSE precio
    END AS precio_con_descuento
FROM videojuegos;

-- CASE en ORDER BY
SELECT titulo, puntuacion
FROM videojuegos
ORDER BY 
    CASE 
        WHEN puntuacion >= 9.0 THEN 1
        WHEN puntuacion >= 8.0 THEN 2
        ELSE 3
    END;
