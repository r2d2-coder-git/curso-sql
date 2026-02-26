-- =====================================================
-- DÍA 7: PROYECTO FINAL - SISTEMA DE JUEGO RPG
-- Ejercicios Integradores de Todo el Curso
-- =====================================================

/*
INSTRUCCIONES:
1. Ejecuta primero: 01.creacion_tablas.sql
2. Carga todos los datos de la carpeta insert_data/ en orden
3. Resuelve los ejercicios siguientes que integran todo lo aprendido

MODELO DE DATOS:
- jugadores (id_jugador, nombre_jugador, nivel, experiencia, clan_id)
- clanes (id_clan, nombre_clan, fecha_creacion, lider_id)
- equipamientos (id_equipamiento, nombre_equipamiento, tipo, nivel_requerido, bono_ataque, bono_defensa)
- recompensas (id_recompensa, tipo_recompensa, descripcion_recompensa)
- monstruos (id_monstruo, nombre_monstruo, nivel_monstruo, vida, tipo_monstruo, recompensa_id)
- misiones (id_mision, nombre_mision, dificultad, recompensa_xp, recompensa_oro, recompensa_id, monstruo_id)
- jugadores_misiones (id_jugador, id_mision, fecha_completada, completada)
- jugadores_recompensas (id_jugador, id_recompensa, fecha_obtenida)
- jugadores_equipamientos (id_jugador, id_equipamiento, cantidad)
*/

-- =====================================================
-- SECCIÓN 1: CONSULTAS BÁSICAS (Día 2)
-- =====================================================

-- 1.1 Selecciona todos los jugadores con nivel superior a 10
-- Tu respuesta:


-- 1.2 Muestra los nombres de los clanes creados después del 1 de enero de 2021
-- Tu respuesta:


-- 1.3 Lista todos los equipamientos de tipo "arma" con nivel requerido menor a 10
-- Tu respuesta:


-- 1.4 Encuentra todas las misiones de dificultad "Muy Difícil"
-- Tu respuesta:


-- 1.5 Selecciona los monstruos de tipo "dragón" con más de 500 de vida
-- Tu respuesta:


-- 1.6 Actualiza la experiencia del jugador "Arthorius" sumándole 500 puntos
-- Tu respuesta:


-- 1.7 Elimina todas las misiones completadas antes del 1 de enero de 2024
-- (de la tabla jugadores_misiones)
-- Tu respuesta:


-- 1.8 Muestra los 5 jugadores con mayor nivel, ordenados descendentemente
-- Tu respuesta:


-- 1.9 Cuenta cuántos jugadores hay en total
-- Tu respuesta:


-- 1.10 Lista los nombres de jugadores que contengan la letra "a" (mayúscula o minúscula)
-- Tu respuesta:


-- =====================================================
-- SECCIÓN 2: OPERACIONES INTERMEDIAS (Día 3)
-- =====================================================

-- 2.1 Clasifica a los jugadores según su nivel:
--     - Nivel 1-5: "Novato"
--     - Nivel 6-10: "Intermedio"
--     - Nivel 11-15: "Avanzado"
--     - Más de 15: "Maestro"
-- Tu respuesta:


-- 2.2 Cuenta cuántos jugadores hay en cada clan
-- Tu respuesta:


-- 2.3 Muestra los clanes que tienen más de 4 jugadores
-- Tu respuesta:


-- 2.4 Calcula el nivel promedio, máximo y mínimo de todos los jugadores
-- Tu respuesta:


-- 2.5 Encuentra el equipamiento con mayor bono de ataque
-- Tu respuesta:


-- 2.6 Lista todos los tipos de monstruos únicos (sin duplicados)
-- Tu respuesta:


-- 2.7 Muestra las misiones ordenadas por recompensa de oro (mayor a menor)
-- y luego por recompensa de experiencia (mayor a menor)
-- Tu respuesta:


-- 2.8 Calcula la experiencia total y promedio por clan
-- Tu respuesta:


-- 2.9 Encuentra los jugadores que NO tienen clan asignado (clan_id es NULL)
-- y muestra "Sin Clan" en lugar de NULL
-- Tu respuesta:


-- 2.10 Cuenta cuántas misiones hay de cada nivel de dificultad
-- Tu respuesta:


-- =====================================================
-- SECCIÓN 3: OPERACIONES AVANZADAS (Día 4)
-- =====================================================

-- 3.1 Usa una SUBCONSULTA para encontrar jugadores con experiencia
-- superior al promedio
-- Tu respuesta:


-- 3.2 Usa WITH (CTE) para calcular estadísticas por clan:
--     - Nombre del clan
--     - Total de jugadores
--     - Nivel promedio
--     - Experiencia total
-- Luego muestra solo los clanes con más de 3 jugadores
-- Tu respuesta:


-- 3.3 Usa ROW_NUMBER para numerar a los jugadores dentro de cada clan
-- ordenados por nivel descendente
-- Tu respuesta:


-- 3.4 Usa DENSE_RANK para rankear a los jugadores globalmente por experiencia
-- Tu respuesta:


-- 3.5 Usa LAG para mostrar, para cada jugador, cuál es el jugador anterior
-- en términos de experiencia (ordenado por experiencia descendente)
-- Tu respuesta:


-- 3.6 Usa LEAD para mostrar el siguiente nivel de equipamiento
-- (ordenado por nivel_requerido)
-- Tu respuesta:


-- 3.7 Crea un PIVOT que muestre la cantidad de misiones por dificultad
-- y por rango de recompensa de oro:
--     - Bajo: 0-100
--     - Medio: 101-300
--     - Alto: 301+
-- Tu respuesta:


-- 3.8 Usa window functions para calcular:
--     - El nivel de cada jugador
--     - El nivel promedio de su clan
--     - La diferencia entre su nivel y el promedio del clan
-- Tu respuesta:


-- 3.9 Encuentra el top 3 de jugadores con más experiencia de cada clan
-- usando ROW_NUMBER y CTE
-- Tu respuesta:


-- 3.10 Calcula la suma acumulada de experiencia de los jugadores
-- ordenados por nivel ascendente
-- Tu respuesta:


-- =====================================================
-- SECCIÓN 4: RELACIONES Y JOINS (Día 5)
-- =====================================================

-- 4.1 INNER JOIN: Muestra todos los jugadores con el nombre de su clan
-- Tu respuesta:


-- 4.2 LEFT JOIN: Muestra todos los clanes y cuántos jugadores tienen
-- (incluye clanes sin jugadores)
-- Tu respuesta:


-- 4.3 Muestra todas las misiones con el nombre del monstruo que hay que derrotar
-- Tu respuesta:


-- 4.4 Lista todos los jugadores con sus misiones completadas
-- mostrando: nombre jugador, nombre misión, fecha completada
-- Tu respuesta:


-- 4.5 Muestra el equipamiento que tiene cada jugador
-- incluyendo: nombre jugador, nombre equipamiento, cantidad
-- Tu respuesta:


-- 4.6 Encuentra los jugadores que NO han completado ninguna misión
-- Tu respuesta:


-- 4.7 Muestra los clanes con el nombre de su líder
-- Tu respuesta:


-- 4.8 Lista las misiones con su recompensa (tipo y descripción)
-- Tu respuesta:


-- 4.9 Muestra un ranking de clanes por experiencia total de sus miembros
-- Tu respuesta:


-- 4.10 UNION: Crea una lista combinada de:
--      - Nombres de jugadores con el texto "Jugador"
--      - Nombres de clanes con el texto "Clan"
-- Tu respuesta:


-- =====================================================
-- SECCIÓN 5: CONSULTAS COMPLEJAS INTEGRADAS
-- =====================================================

-- 5.1 Encuentra el jugador más poderoso de cada clan
-- (considerando nivel + experiencia/1000)
-- Tu respuesta:


-- 5.2 Calcula el "poder de combate" de cada jugador sumando:
--     - Su nivel * 10
--     - Suma de bonos de ataque de su equipamiento
--     - Suma de bonos de defensa de su equipamiento
-- Muestra el top 10
-- Tu respuesta:


-- 5.3 Crea un reporte de actividad de clanes que muestre:
--     - Nombre del clan
--     - Fecha de creación
--     - Nombre del líder
--     - Total de miembros
--     - Nivel promedio de miembros
--     - Total de misiones completadas por todos los miembros
-- Tu respuesta:


-- 5.4 Encuentra las misiones que ningún jugador ha completado aún
-- Tu respuesta:


-- 5.5 Muestra los jugadores "veteranos" (nivel >= 12) que tienen
-- equipamiento de nivel inferior a su nivel actual
-- Tu respuesta:


-- 5.6 Calcula qué porcentaje de misiones ha completado cada jugador
-- Tu respuesta:


-- 5.7 Encuentra los "clanes élite" que cumplen TODAS estas condiciones:
--     - Tienen más de 4 miembros
--     - El nivel promedio de sus miembros es superior a 9
--     - Fueron creados antes de 2022
-- Tu respuesta:


-- 5.8 Crea un ranking de monstruos por "peligrosidad" considerando:
--     - Su nivel * 2
--     - Su vida / 10
-- Muestra el top 10 más peligrosos
-- Tu respuesta:


-- 5.9 Identifica los jugadores "coleccionistas" que tienen más de 5
-- equipamientos diferentes
-- Tu respuesta:


-- 5.10 Genera un reporte de "eficiencia de misiones" que muestre:
--      - Nombre de la misión
--      - Dificultad
--      - Ratio XP/Oro
--      - Cantidad de jugadores que la completaron
--      - Clasificación: "Muy Eficiente" si ratio > 10, 
--        "Eficiente" si ratio 5-10, "Normal" si < 5
-- Tu respuesta:


-- =====================================================
-- SECCIÓN 6: OPTIMIZACIÓN Y PROCEDIMIENTOS (Día 6)
-- =====================================================

-- 6.1 Crea un índice para optimizar búsquedas de jugadores por nivel
-- Tu respuesta:


-- 6.2 Crea un índice compuesto para optimizar búsquedas de misiones
-- por dificultad y recompensa_oro
-- Tu respuesta:


-- 6.3 Crea un procedimiento almacenado "completar_mision" que:
--     - Reciba: id_jugador, id_mision
--     - Marque la misión como completada
--     - Actualice la experiencia del jugador sumando la recompensa_xp
--     - Inserte la fecha actual como fecha_completada
-- Tu respuesta:


-- 6.4 Crea un procedimiento "subir_nivel" que:
--     - Reciba: id_jugador
--     - Incremente el nivel del jugador en 1
--     - Reinicie su experiencia a 0
-- Tu respuesta:


-- 6.5 Crea una función "calcular_poder_clan" que:
--     - Reciba: id_clan
--     - Retorne: la suma de niveles de todos sus miembros
-- Tu respuesta:


-- 6.6 Crea una función "puede_usar_equipamiento" que:
--     - Reciba: id_jugador, id_equipamiento
--     - Retorne: TRUE si el nivel del jugador >= nivel_requerido del equipo
--     - Retorne: FALSE en caso contrario
-- Tu respuesta:


-- 6.7 Usa EXPLAIN ANALYZE para comparar estas dos consultas:
--     a) SELECT * FROM jugadores WHERE nivel = 10;
--     b) SELECT * FROM jugadores WHERE nivel > 5 AND nivel < 15;
-- ¿Cuál es más eficiente?
-- Tu respuesta:


-- 6.8 Crea una función que retorne una tabla con los jugadores
-- de un clan específico ordenados por nivel
-- Tu respuesta:


-- 6.9 Crea un procedimiento "asignar_recompensa" que:
--     - Reciba: id_jugador, id_recompensa
--     - Inserte el registro en jugadores_recompensas
--     - Use la fecha actual
--     - Maneje el error si ya existe la recompensa para ese jugador
-- Tu respuesta:


-- 6.10 Consulta las estadísticas de uso de las tablas principales
-- usando pg_stat_user_tables
-- Tu respuesta:


-- =====================================================
-- SECCIÓN 7: DESAFÍOS FINALES
-- =====================================================

-- 7.1 DESAFÍO: Sistema de Recomendación de Misiones
-- Crea una consulta que recomiende misiones a un jugador específico:
--     - Que NO haya completado aún
--     - Que la dificultad sea apropiada para su nivel:
--       * Nivel 1-5: Fácil
--       * Nivel 6-10: Fácil o Intermedio
--       * Nivel 11-15: Cualquiera
--     - Ordenadas por recompensa de XP descendente
-- Pruébalo con el jugador id=10
-- Tu respuesta:


-- 7.2 DESAFÍO: Análisis de Progresión de Jugadores
-- Crea un reporte que muestre para cada jugador:
--     - Nombre
--     - Nivel actual
--     - Experiencia actual
--     - Experiencia necesaria para siguiente nivel (nivel * 1000)
--     - Porcentaje de progreso al siguiente nivel
--     - Clasificación: "Cerca de subir" si > 80%, "En progreso" si no
-- Tu respuesta:


-- 7.3 DESAFÍO: Sistema de Matchmaking de Clanes
-- Encuentra pares de clanes que podrían ser buenos rivales:
--     - Diferencia de nivel promedio menor a 2
--     - Diferencia en cantidad de miembros menor a 3
--     - No incluir el mismo clan dos veces
-- Tu respuesta:


-- 7.4 DESAFÍO: Detección de Jugadores Inactivos
-- Identifica jugadores "inactivos" que:
--     - No han completado ninguna misión en los últimos 30 días
--     - O no tienen ninguna misión completada
-- Muestra: nombre, nivel, última fecha de actividad (o "Nunca")
-- Tu respuesta:


-- 7.5 DESAFÍO: Sistema de Logros
-- Crea una consulta que identifique jugadores que merecen logros:
--     - "Maestro de Armas": Tiene más de 3 armas
--     - "Cazador de Dragones": Ha completado misiones contra dragones
--     - "Líder Nato": Es líder de un clan
--     - "Veterano": Nivel >= 12
-- Muestra: nombre jugador, logros obtenidos (concatenados)
-- Tu respuesta:


-- =====================================================
-- FIN DEL PROYECTO FINAL
-- =====================================================

/*
CRITERIOS DE EVALUACIÓN:
- Sintaxis correcta de SQL
- Uso apropiado de JOINs
- Aplicación de funciones agregadas
- Uso de subconsultas y CTEs cuando sea necesario
- Optimización de consultas
- Creatividad en las soluciones

¡FELICIDADES POR COMPLETAR EL CURSO DE SQL EN 7 DÍAS!
*/
