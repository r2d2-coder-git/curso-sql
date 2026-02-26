-- =====================================================
-- PRÁCTICA: Manejo de valores NULL
-- IS NULL, IS NOT NULL, COALESCE
-- =====================================================

-- Agregar columna que puede tener NULL
ALTER TABLE videojuegos ADD COLUMN unidades_vendidas INTEGER;

-- Actualizar algunos valores
UPDATE videojuegos SET unidades_vendidas = 15000 WHERE titulo = 'The Legend of Zelda';
UPDATE videojuegos SET unidades_vendidas = 25000 WHERE titulo = 'FIFA 24';
-- Cyberpunk 2077 quedará con NULL

-- Encontrar registros con NULL
SELECT titulo, unidades_vendidas
FROM videojuegos
WHERE unidades_vendidas IS NULL;

-- Encontrar registros sin NULL
SELECT titulo, unidades_vendidas
FROM videojuegos
WHERE unidades_vendidas IS NOT NULL;

-- COALESCE: Reemplazar NULL con un valor por defecto
SELECT 
    titulo,
    COALESCE(unidades_vendidas, 0) AS ventas
FROM videojuegos;

-- COALESCE con múltiples valores
SELECT 
    titulo,
    COALESCE(unidades_vendidas, 0) AS ventas,
    COALESCE(CAST(unidades_vendidas AS VARCHAR), 'Sin datos') AS ventas_texto
FROM videojuegos;

-- Calcular totales manejando NULL
SELECT 
    SUM(COALESCE(unidades_vendidas, 0)) AS total_ventas,
    AVG(COALESCE(unidades_vendidas, 0)) AS promedio_ventas
FROM videojuegos;

-- NULLIF: Convertir un valor específico en NULL
SELECT 
    titulo,
    NULLIF(unidades_vendidas, 0) AS ventas_sin_ceros
FROM videojuegos;

-- Ordenar con NULL
SELECT titulo, unidades_vendidas
FROM videojuegos
ORDER BY unidades_vendidas DESC NULLS LAST;

-- Contar excluyendo NULL
SELECT 
    COUNT(*) AS total_juegos,
    COUNT(unidades_vendidas) AS juegos_con_ventas,
    COUNT(*) - COUNT(unidades_vendidas) AS juegos_sin_datos
FROM videojuegos;
