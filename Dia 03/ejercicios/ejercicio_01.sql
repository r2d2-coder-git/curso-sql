-- =====================================================
-- EJERCICIO 1: Sistema de Gestión de Películas
-- =====================================================

-- Asegurarse de usar el esquema dia03

-- 1. Crea una tabla "peliculas" con las siguientes columnas:
--    - id_pelicula (entero, clave primaria, autoincremental)
--    - titulo (texto de máximo 150 caracteres, no nulo)
--    - director (texto de máximo 100 caracteres)
--    - genero (texto de máximo 50 caracteres)
--    - duracion_minutos (entero)
--    - fecha_estreno (fecha)
--    - calificacion (decimal con 1 decimal)
--    - recaudacion_millones (decimal con 2 decimales, puede ser nulo)


-- 2. Inserta al menos 8 películas con datos variados (incluye algunos valores NULL en recaudacion)


-- 3. Selecciona todas las películas estrenadas en el año 2023


-- 4. Calcula cuántos años han pasado desde el estreno de cada película


-- 5. Clasifica las películas según su duración:
--    - Menos de 90 minutos: "Corta"
--    - Entre 90 y 150 minutos: "Media"
--    - Más de 150 minutos: "Larga"


-- 6. Cuenta cuántas películas hay de cada género


-- 7. Muestra los géneros que tienen más de 2 películas


-- 8. Encuentra la película con mayor y menor calificación


-- 9. Calcula la recaudación promedio por género (maneja los valores NULL)


-- 10. Ordena las películas por fecha de estreno (más recientes primero) 
--     y luego por calificación (mayor a menor)
