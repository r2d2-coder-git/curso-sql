-- =====================================================
-- PRÁCTICA: OPERACIONES DE FECHA
-- NOW, CURRENT_DATE, CURRENT_TIME, EXTRACT
-- =====================================================

-- Asegurarse de usar el esquema dia03

-- Crear tabla de ejemplo
CREATE TABLE IF NOT EXISTS videojuegos (
    id_juego SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    precio DECIMAL(6,2),
    fecha_lanzamiento DATE,
    puntuacion DECIMAL(3,1)
);

-- Insertar datos
INSERT INTO videojuegos (titulo, genero, precio, fecha_lanzamiento, puntuacion) VALUES
    ('The Legend of Zelda', 'Aventura', 59.99, '2023-05-12', 9.5),
    ('FIFA 24', 'Deportes', 69.99, '2023-09-29', 8.2),
    ('Cyberpunk 2077', 'RPG', 49.99, '2020-12-10', 7.8);

-- Obtener la fecha y hora actual
SELECT NOW();

-- Obtener solo la fecha actual
SELECT CURRENT_DATE;

-- Obtener solo la hora actual
SELECT CURRENT_TIME;

-- Extraer partes de una fecha
SELECT 
    titulo,
    fecha_lanzamiento,
    EXTRACT(YEAR FROM fecha_lanzamiento) AS año,
    EXTRACT(MONTH FROM fecha_lanzamiento) AS mes,
    EXTRACT(DAY FROM fecha_lanzamiento) AS dia,
    EXTRACT(DOW FROM fecha_lanzamiento) AS dia_semana
FROM videojuegos;

-- Calcular antigüedad
SELECT 
    titulo,
    fecha_lanzamiento,
    CURRENT_DATE - fecha_lanzamiento AS dias_desde_lanzamiento,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_lanzamiento)) AS años
FROM videojuegos;

-- Filtrar por año
SELECT titulo, fecha_lanzamiento 
FROM videojuegos 
WHERE EXTRACT(YEAR FROM fecha_lanzamiento) = 2023;

-- Filtrar por mes
SELECT titulo, fecha_lanzamiento 
FROM videojuegos 
WHERE EXTRACT(MONTH FROM fecha_lanzamiento) = 9;

-- Sumar/restar días a una fecha
SELECT 
    titulo,
    fecha_lanzamiento,
    fecha_lanzamiento + INTERVAL '30 days' AS fecha_mas_30_dias,
    fecha_lanzamiento - INTERVAL '1 year' AS hace_un_año
FROM videojuegos;
