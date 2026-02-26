-- =====================================================
-- DÍA 7: PROYECTO FINAL - SOLUCIONES
-- Sistema de Juego RPG
-- =====================================================

-- =====================================================
-- SECCIÓN 1: CONSULTAS BÁSICAS (Día 2)
-- =====================================================

-- 1.1 Jugadores con nivel superior a 10
SELECT * FROM jugadores WHERE nivel > 10;

-- 1.2 Clanes creados después del 1 de enero de 2021
SELECT nombre_clan, fecha_creacion 
FROM clanes 
WHERE fecha_creacion > '2021-01-01';

-- 1.3 Equipamientos de tipo "arma" con nivel requerido menor a 10
SELECT * FROM equipamientos 
WHERE tipo = 'arma' AND nivel_requerido < 10;

-- 1.4 Misiones de dificultad "Muy Difícil"
SELECT * FROM misiones WHERE dificultad = 'Muy Difícil';

-- 1.5 Monstruos de tipo "dragón" con más de 500 de vida
SELECT * FROM monstruos 
WHERE tipo_monstruo = 'dragón' AND vida > 500;

-- 1.6 Actualizar experiencia de Arthorius
UPDATE jugadores 
SET experiencia = experiencia + 500 
WHERE nombre_jugador = 'Arthorius';

-- 1.7 Eliminar misiones completadas antes del 1 de enero de 2024
DELETE FROM jugadores_misiones 
WHERE fecha_completada < '2024-01-01';

-- 1.8 Top 5 jugadores con mayor nivel
SELECT nombre_jugador, nivel 
FROM jugadores 
ORDER BY nivel DESC 
LIMIT 5;

-- 1.9 Contar jugadores totales
SELECT COUNT(*) AS total_jugadores FROM jugadores;

-- 1.10 Jugadores con letra "a"
SELECT nombre_jugador FROM jugadores 
WHERE nombre_jugador ILIKE '%a%';


-- =====================================================
-- SECCIÓN 2: OPERACIONES INTERMEDIAS (Día 3)
-- =====================================================

-- 2.1 Clasificar jugadores por nivel
SELECT 
    nombre_jugador,
    nivel,
    CASE 
        WHEN nivel BETWEEN 1 AND 5 THEN 'Novato'
        WHEN nivel BETWEEN 6 AND 10 THEN 'Intermedio'
        WHEN nivel BETWEEN 11 AND 15 THEN 'Avanzado'
        ELSE 'Maestro'
    END AS clasificacion
FROM jugadores
ORDER BY nivel DESC;

-- 2.2 Contar jugadores por clan
SELECT 
    c.nombre_clan,
    COUNT(j.id_jugador) AS total_jugadores
FROM clanes c
LEFT JOIN jugadores j ON c.id_clan = j.clan_id
GROUP BY c.id_clan, c.nombre_clan;

-- 2.3 Clanes con más de 4 jugadores
SELECT 
    c.nombre_clan,
    COUNT(j.id_jugador) AS total_jugadores
FROM clanes c
JOIN jugadores j ON c.id_clan = j.clan_id
GROUP BY c.id_clan, c.nombre_clan
HAVING COUNT(j.id_jugador) > 4;

-- 2.4 Estadísticas de nivel de jugadores
SELECT 
    ROUND(AVG(nivel), 2) AS nivel_promedio,
    MAX(nivel) AS nivel_maximo,
    MIN(nivel) AS nivel_minimo
FROM jugadores;

-- 2.5 Equipamiento con mayor bono de ataque
SELECT nombre_equipamiento, bono_ataque
FROM equipamientos
WHERE bono_ataque = (SELECT MAX(bono_ataque) FROM equipamientos);

-- 2.6 Tipos de monstruos únicos
SELECT DISTINCT tipo_monstruo FROM monstruos ORDER BY tipo_monstruo;

-- 2.7 Misiones ordenadas por recompensas
SELECT nombre_mision, dificultad, recompensa_oro, recompensa_xp
FROM misiones
ORDER BY recompensa_oro DESC, recompensa_xp DESC;

-- 2.8 Experiencia total y promedio por clan
SELECT 
    c.nombre_clan,
    SUM(j.experiencia) AS experiencia_total,
    ROUND(AVG(j.experiencia), 2) AS experiencia_promedio
FROM clanes c
JOIN jugadores j ON c.id_clan = j.clan_id
GROUP BY c.id_clan, c.nombre_clan;

-- 2.9 Jugadores sin clan
SELECT 
    nombre_jugador,
    nivel,
    COALESCE(CAST(clan_id AS VARCHAR), 'Sin Clan') AS clan
FROM jugadores
WHERE clan_id IS NULL;

-- 2.10 Contar misiones por dificultad
SELECT dificultad, COUNT(*) AS total_misiones
FROM misiones
GROUP BY dificultad
ORDER BY total_misiones DESC;


-- =====================================================
-- SECCIÓN 3: OPERACIONES AVANZADAS (Día 4)
-- =====================================================

-- 3.1 Jugadores con experiencia superior al promedio
SELECT nombre_jugador, nivel, experiencia
FROM jugadores
WHERE experiencia > (SELECT AVG(experiencia) FROM jugadores)
ORDER BY experiencia DESC;

-- 3.2 Estadísticas por clan con CTE
WITH stats_clan AS (
    SELECT 
        c.nombre_clan,
        COUNT(j.id_jugador) AS total_jugadores,
        ROUND(AVG(j.nivel), 2) AS nivel_promedio,
        SUM(j.experiencia) AS experiencia_total
    FROM clanes c
    JOIN jugadores j ON c.id_clan = j.clan_id
    GROUP BY c.id_clan, c.nombre_clan
)
SELECT * FROM stats_clan
WHERE total_jugadores > 3
ORDER BY experiencia_total DESC;

-- 3.3 ROW_NUMBER por clan
SELECT 
    c.nombre_clan,
    j.nombre_jugador,
    j.nivel,
    ROW_NUMBER() OVER(PARTITION BY j.clan_id ORDER BY j.nivel DESC) AS ranking_clan
FROM jugadores j
JOIN clanes c ON j.clan_id = c.id_clan
ORDER BY c.nombre_clan, ranking_clan;

-- 3.4 DENSE_RANK global por experiencia
SELECT 
    nombre_jugador,
    nivel,
    experiencia,
    DENSE_RANK() OVER(ORDER BY experiencia DESC) AS ranking_global
FROM jugadores;

-- 3.5 LAG para ver jugador anterior por experiencia
SELECT 
    nombre_jugador,
    experiencia,
    LAG(nombre_jugador) OVER(ORDER BY experiencia DESC) AS jugador_anterior,
    LAG(experiencia) OVER(ORDER BY experiencia DESC) AS exp_anterior
FROM jugadores;

-- 3.6 LEAD para siguiente nivel de equipamiento
SELECT 
    nombre_equipamiento,
    nivel_requerido,
    LEAD(nombre_equipamiento) OVER(ORDER BY nivel_requerido) AS siguiente_equipo,
    LEAD(nivel_requerido) OVER(ORDER BY nivel_requerido) AS siguiente_nivel
FROM equipamientos
ORDER BY nivel_requerido;

-- 3.7 PIVOT de misiones por dificultad y rango de oro
SELECT 
    dificultad,
    SUM(CASE WHEN recompensa_oro BETWEEN 0 AND 100 THEN 1 ELSE 0 END) AS "Bajo (0-100)",
    SUM(CASE WHEN recompensa_oro BETWEEN 101 AND 300 THEN 1 ELSE 0 END) AS "Medio (101-300)",
    SUM(CASE WHEN recompensa_oro > 300 THEN 1 ELSE 0 END) AS "Alto (301+)"
FROM misiones
GROUP BY dificultad;

-- 3.8 Window function: nivel vs promedio del clan
SELECT 
    j.nombre_jugador,
    j.nivel,
    c.nombre_clan,
    ROUND(AVG(j.nivel) OVER(PARTITION BY j.clan_id), 2) AS nivel_promedio_clan,
    j.nivel - ROUND(AVG(j.nivel) OVER(PARTITION BY j.clan_id), 2) AS diferencia
FROM jugadores j
JOIN clanes c ON j.clan_id = c.id_clan
ORDER BY c.nombre_clan, j.nivel DESC;

-- 3.9 Top 3 jugadores por clan
WITH ranking AS (
    SELECT 
        c.nombre_clan,
        j.nombre_jugador,
        j.experiencia,
        ROW_NUMBER() OVER(PARTITION BY j.clan_id ORDER BY j.experiencia DESC) AS rank
    FROM jugadores j
    JOIN clanes c ON j.clan_id = c.id_clan
)
SELECT nombre_clan, nombre_jugador, experiencia, rank
FROM ranking
WHERE rank <= 3
ORDER BY nombre_clan, rank;

-- 3.10 Suma acumulada de experiencia
SELECT 
    nombre_jugador,
    nivel,
    experiencia,
    SUM(experiencia) OVER(ORDER BY nivel ASC) AS experiencia_acumulada
FROM jugadores
ORDER BY nivel;


-- =====================================================
-- SECCIÓN 4: RELACIONES Y JOINS (Día 5)
-- =====================================================

-- 4.1 Jugadores con nombre de clan
SELECT 
    j.nombre_jugador,
    j.nivel,
    c.nombre_clan
FROM jugadores j
INNER JOIN clanes c ON j.clan_id = c.id_clan
ORDER BY c.nombre_clan, j.nivel DESC;

-- 4.2 Clanes y cantidad de jugadores
SELECT 
    c.nombre_clan,
    COUNT(j.id_jugador) AS total_jugadores
FROM clanes c
LEFT JOIN jugadores j ON c.id_clan = j.clan_id
GROUP BY c.id_clan, c.nombre_clan
ORDER BY total_jugadores DESC;

-- 4.3 Misiones con nombre del monstruo
SELECT 
    m.nombre_mision,
    m.dificultad,
    mo.nombre_monstruo,
    mo.nivel_monstruo
FROM misiones m
INNER JOIN monstruos mo ON m.monstruo_id = mo.id_monstruo
ORDER BY m.dificultad, mo.nivel_monstruo DESC;

-- 4.4 Jugadores con misiones completadas
SELECT 
    j.nombre_jugador,
    m.nombre_mision,
    jm.fecha_completada
FROM jugadores_misiones jm
INNER JOIN jugadores j ON jm.id_jugador = j.id_jugador
INNER JOIN misiones m ON jm.id_mision = m.id_mision
WHERE jm.completada = TRUE
ORDER BY jm.fecha_completada DESC;

-- 4.5 Equipamiento de cada jugador
SELECT 
    j.nombre_jugador,
    e.nombre_equipamiento,
    e.tipo,
    je.cantidad
FROM jugadores_equipamientos je
INNER JOIN jugadores j ON je.id_jugador = j.id_jugador
INNER JOIN equipamientos e ON je.id_equipamiento = e.id_equipamiento
ORDER BY j.nombre_jugador, e.tipo;

-- 4.6 Jugadores sin misiones completadas
SELECT j.nombre_jugador, j.nivel
FROM jugadores j
LEFT JOIN jugadores_misiones jm ON j.id_jugador = jm.id_jugador
WHERE jm.id_jugador IS NULL;

-- 4.7 Clanes con nombre del líder
SELECT 
    c.nombre_clan,
    c.fecha_creacion,
    j.nombre_jugador AS lider
FROM clanes c
INNER JOIN jugadores j ON c.lider_id = j.id_jugador
ORDER BY c.fecha_creacion;

-- 4.8 Misiones con su recompensa
SELECT 
    m.nombre_mision,
    m.dificultad,
    r.tipo_recompensa,
    r.descripcion_recompensa
FROM misiones m
INNER JOIN recompensas r ON m.recompensa_id = r.id_recompensa
ORDER BY m.dificultad;

-- 4.9 Ranking de clanes por experiencia total
SELECT 
    c.nombre_clan,
    SUM(j.experiencia) AS experiencia_total,
    COUNT(j.id_jugador) AS total_miembros,
    ROUND(AVG(j.experiencia), 2) AS experiencia_promedio
FROM clanes c
JOIN jugadores j ON c.id_clan = j.clan_id
GROUP BY c.id_clan, c.nombre_clan
ORDER BY experiencia_total DESC;

-- 4.10 UNION de jugadores y clanes
SELECT nombre_jugador AS nombre, 'Jugador' AS tipo FROM jugadores
UNION
SELECT nombre_clan AS nombre, 'Clan' AS tipo FROM clanes
ORDER BY tipo, nombre;


-- =====================================================
-- SECCIÓN 5: CONSULTAS COMPLEJAS INTEGRADAS
-- =====================================================

-- 5.1 Jugador más poderoso de cada clan
WITH poder_jugadores AS (
    SELECT 
        j.id_jugador,
        j.nombre_jugador,
        j.clan_id,
        c.nombre_clan,
        (j.nivel + j.experiencia / 1000.0) AS poder,
        ROW_NUMBER() OVER(PARTITION BY j.clan_id ORDER BY (j.nivel + j.experiencia / 1000.0) DESC) AS rank
    FROM jugadores j
    JOIN clanes c ON j.clan_id = c.id_clan
)
SELECT nombre_clan, nombre_jugador, ROUND(poder, 2) AS poder_total
FROM poder_jugadores
WHERE rank = 1
ORDER BY poder_total DESC;

-- 5.2 Poder de combate de jugadores (top 10)
SELECT 
    j.nombre_jugador,
    j.nivel,
    (j.nivel * 10) AS poder_base,
    COALESCE(SUM(e.bono_ataque), 0) AS bono_ataque_total,
    COALESCE(SUM(e.bono_defensa), 0) AS bono_defensa_total,
    (j.nivel * 10 + COALESCE(SUM(e.bono_ataque), 0) + COALESCE(SUM(e.bono_defensa), 0)) AS poder_combate
FROM jugadores j
LEFT JOIN jugadores_equipamientos je ON j.id_jugador = je.id_jugador
LEFT JOIN equipamientos e ON je.id_equipamiento = e.id_equipamiento
GROUP BY j.id_jugador, j.nombre_jugador, j.nivel
ORDER BY poder_combate DESC
LIMIT 10;

-- 5.3 Reporte de actividad de clanes
SELECT 
    c.nombre_clan,
    c.fecha_creacion,
    lider.nombre_jugador AS lider,
    COUNT(DISTINCT j.id_jugador) AS total_miembros,
    ROUND(AVG(j.nivel), 2) AS nivel_promedio,
    COUNT(jm.id_mision) AS misiones_completadas
FROM clanes c
JOIN jugadores lider ON c.lider_id = lider.id_jugador
LEFT JOIN jugadores j ON c.id_clan = j.clan_id
LEFT JOIN jugadores_misiones jm ON j.id_jugador = jm.id_jugador AND jm.completada = TRUE
GROUP BY c.id_clan, c.nombre_clan, c.fecha_creacion, lider.nombre_jugador
ORDER BY misiones_completadas DESC;

-- 5.4 Misiones sin completar
SELECT m.nombre_mision, m.dificultad, m.recompensa_xp
FROM misiones m
LEFT JOIN jugadores_misiones jm ON m.id_mision = jm.id_mision AND jm.completada = TRUE
WHERE jm.id_mision IS NULL
ORDER BY m.recompensa_xp DESC;

-- 5.5 Veteranos con equipamiento inferior
SELECT DISTINCT
    j.nombre_jugador,
    j.nivel AS nivel_jugador,
    e.nombre_equipamiento,
    e.nivel_requerido AS nivel_equipo
FROM jugadores j
JOIN jugadores_equipamientos je ON j.id_jugador = je.id_jugador
JOIN equipamientos e ON je.id_equipamiento = e.id_equipamiento
WHERE j.nivel >= 12 AND e.nivel_requerido < j.nivel
ORDER BY j.nivel DESC, e.nivel_requerido;


-- 5.6 Porcentaje de misiones completadas por jugador
WITH total_misiones AS (
    SELECT COUNT(*) AS total FROM misiones
)
SELECT 
    j.nombre_jugador,
    COUNT(jm.id_mision) AS misiones_completadas,
    tm.total AS total_misiones,
    ROUND((COUNT(jm.id_mision)::DECIMAL / tm.total) * 100, 2) AS porcentaje_completado
FROM jugadores j
CROSS JOIN total_misiones tm
LEFT JOIN jugadores_misiones jm ON j.id_jugador = jm.id_jugador AND jm.completada = TRUE
GROUP BY j.id_jugador, j.nombre_jugador, tm.total
HAVING COUNT(jm.id_mision) > 0
ORDER BY porcentaje_completado DESC;

-- 5.7 Clanes élite
SELECT 
    c.nombre_clan,
    COUNT(j.id_jugador) AS total_miembros,
    ROUND(AVG(j.nivel), 2) AS nivel_promedio,
    c.fecha_creacion
FROM clanes c
JOIN jugadores j ON c.id_clan = j.clan_id
WHERE c.fecha_creacion < '2022-01-01'
GROUP BY c.id_clan, c.nombre_clan, c.fecha_creacion
HAVING COUNT(j.id_jugador) > 4 AND AVG(j.nivel) > 9
ORDER BY nivel_promedio DESC;

-- 5.8 Ranking de monstruos por peligrosidad
SELECT 
    nombre_monstruo,
    tipo_monstruo,
    nivel_monstruo,
    vida,
    (nivel_monstruo * 2 + vida / 10) AS peligrosidad
FROM monstruos
ORDER BY peligrosidad DESC
LIMIT 10;

-- 5.9 Jugadores coleccionistas
SELECT 
    j.nombre_jugador,
    COUNT(DISTINCT je.id_equipamiento) AS equipamientos_diferentes
FROM jugadores j
JOIN jugadores_equipamientos je ON j.id_jugador = je.id_jugador
GROUP BY j.id_jugador, j.nombre_jugador
HAVING COUNT(DISTINCT je.id_equipamiento) > 5
ORDER BY equipamientos_diferentes DESC;

-- 5.10 Reporte de eficiencia de misiones
SELECT 
    m.nombre_mision,
    m.dificultad,
    ROUND(m.recompensa_xp::DECIMAL / NULLIF(m.recompensa_oro, 0), 2) AS ratio_xp_oro,
    COUNT(jm.id_jugador) AS jugadores_completaron,
    CASE 
        WHEN m.recompensa_xp::DECIMAL / NULLIF(m.recompensa_oro, 0) > 10 THEN 'Muy Eficiente'
        WHEN m.recompensa_xp::DECIMAL / NULLIF(m.recompensa_oro, 0) BETWEEN 5 AND 10 THEN 'Eficiente'
        ELSE 'Normal'
    END AS clasificacion
FROM misiones m
LEFT JOIN jugadores_misiones jm ON m.id_mision = jm.id_mision AND jm.completada = TRUE
GROUP BY m.id_mision, m.nombre_mision, m.dificultad, m.recompensa_xp, m.recompensa_oro
ORDER BY ratio_xp_oro DESC;


-- =====================================================
-- SECCIÓN 6: OPTIMIZACIÓN Y PROCEDIMIENTOS (Día 6)
-- =====================================================

-- 6.1 Índice para búsquedas por nivel
CREATE INDEX idx_jugadores_nivel ON jugadores(nivel);

-- 6.2 Índice compuesto para misiones
CREATE INDEX idx_misiones_dificultad_oro ON misiones(dificultad, recompensa_oro);

-- 6.3 Procedimiento completar_mision
CREATE OR REPLACE PROCEDURE completar_mision(
    p_id_jugador INTEGER,
    p_id_mision INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_recompensa_xp INTEGER;
BEGIN
    -- Obtener la recompensa de XP de la misión
    SELECT recompensa_xp INTO v_recompensa_xp
    FROM misiones
    WHERE id_mision = p_id_mision;
    
    -- Actualizar jugadores_misiones
    UPDATE jugadores_misiones
    SET completada = TRUE, fecha_completada = CURRENT_DATE
    WHERE id_jugador = p_id_jugador AND id_mision = p_id_mision;
    
    -- Si no existe el registro, insertarlo
    IF NOT FOUND THEN
        INSERT INTO jugadores_misiones (id_jugador, id_mision, fecha_completada, completada)
        VALUES (p_id_jugador, p_id_mision, CURRENT_DATE, TRUE);
    END IF;
    
    -- Actualizar experiencia del jugador
    UPDATE jugadores
    SET experiencia = experiencia + v_recompensa_xp
    WHERE id_jugador = p_id_jugador;
    
    RAISE NOTICE 'Misión completada. XP ganada: %', v_recompensa_xp;
END;
$$;

-- 6.4 Procedimiento subir_nivel
CREATE OR REPLACE PROCEDURE subir_nivel(p_id_jugador INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE jugadores
    SET nivel = nivel + 1, experiencia = 0
    WHERE id_jugador = p_id_jugador;
    
    RAISE NOTICE 'Jugador subió de nivel';
END;
$$;

-- 6.5 Función calcular_poder_clan
CREATE OR REPLACE FUNCTION calcular_poder_clan(p_id_clan INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_poder_total INTEGER;
BEGIN
    SELECT SUM(nivel) INTO v_poder_total
    FROM jugadores
    WHERE clan_id = p_id_clan;
    
    RETURN COALESCE(v_poder_total, 0);
END;
$$;

-- Ejemplo de uso:
-- SELECT calcular_poder_clan(1);

-- 6.6 Función puede_usar_equipamiento
CREATE OR REPLACE FUNCTION puede_usar_equipamiento(
    p_id_jugador INTEGER,
    p_id_equipamiento INTEGER
)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    v_nivel_jugador INTEGER;
    v_nivel_requerido INTEGER;
BEGIN
    SELECT nivel INTO v_nivel_jugador
    FROM jugadores
    WHERE id_jugador = p_id_jugador;
    
    SELECT nivel_requerido INTO v_nivel_requerido
    FROM equipamientos
    WHERE id_equipamiento = p_id_equipamiento;
    
    RETURN v_nivel_jugador >= v_nivel_requerido;
END;
$$;

-- Ejemplo de uso:
-- SELECT puede_usar_equipamiento(1, 5);

-- 6.7 EXPLAIN ANALYZE comparación
EXPLAIN ANALYZE SELECT * FROM jugadores WHERE nivel = 10;
EXPLAIN ANALYZE SELECT * FROM jugadores WHERE nivel > 5 AND nivel < 15;

-- La segunda consulta puede ser menos eficiente si no hay índice,
-- ya que evalúa un rango en lugar de un valor exacto

-- 6.8 Función que retorna tabla de jugadores por clan
CREATE OR REPLACE FUNCTION jugadores_por_clan(p_id_clan INTEGER)
RETURNS TABLE (
    nombre VARCHAR,
    nivel INTEGER,
    experiencia INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT nombre_jugador, j.nivel, j.experiencia
    FROM jugadores j
    WHERE clan_id = p_id_clan
    ORDER BY j.nivel DESC;
END;
$$;

-- Ejemplo de uso:
-- SELECT * FROM jugadores_por_clan(1);

-- 6.9 Procedimiento asignar_recompensa
CREATE OR REPLACE PROCEDURE asignar_recompensa(
    p_id_jugador INTEGER,
    p_id_recompensa INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Intentar insertar la recompensa
    INSERT INTO jugadores_recompensas (id_jugador, id_recompensa, fecha_obtenida)
    VALUES (p_id_jugador, p_id_recompensa, CURRENT_DATE)
    ON CONFLICT (id_jugador, id_recompensa) DO NOTHING;
    
    IF FOUND THEN
        RAISE NOTICE 'Recompensa asignada exitosamente';
    ELSE
        RAISE NOTICE 'El jugador ya tiene esta recompensa';
    END IF;
END;
$$;

-- 6.10 Estadísticas de uso de tablas
SELECT 
    schemaname,
    tablename,
    seq_scan AS escaneos_secuenciales,
    seq_tup_read AS filas_leidas_secuencial,
    idx_scan AS escaneos_indice,
    idx_tup_fetch AS filas_obtenidas_indice,
    n_tup_ins AS inserciones,
    n_tup_upd AS actualizaciones,
    n_tup_del AS eliminaciones
FROM pg_stat_user_tables
WHERE schemaname = 'public'
ORDER BY seq_scan DESC;


-- =====================================================
-- SECCIÓN 7: DESAFÍOS FINALES
-- =====================================================

-- 7.1 Sistema de Recomendación de Misiones
WITH jugador_info AS (
    SELECT nivel FROM jugadores WHERE id_jugador = 10
)
SELECT 
    m.nombre_mision,
    m.dificultad,
    m.recompensa_xp,
    m.recompensa_oro,
    mo.nombre_monstruo
FROM misiones m
JOIN monstruos mo ON m.monstruo_id = mo.id_monstruo
CROSS JOIN jugador_info ji
WHERE m.id_mision NOT IN (
    SELECT id_mision FROM jugadores_misiones 
    WHERE id_jugador = 10 AND completada = TRUE
)
AND (
    (ji.nivel BETWEEN 1 AND 5 AND m.dificultad = 'Fácil') OR
    (ji.nivel BETWEEN 6 AND 10 AND m.dificultad IN ('Fácil', 'Intermedio')) OR
    (ji.nivel >= 11)
)
ORDER BY m.recompensa_xp DESC
LIMIT 10;

-- 7.2 Análisis de Progresión de Jugadores
SELECT 
    nombre_jugador,
    nivel AS nivel_actual,
    experiencia AS experiencia_actual,
    (nivel * 1000) AS experiencia_necesaria,
    ROUND((experiencia::DECIMAL / (nivel * 1000)) * 100, 2) AS porcentaje_progreso,
    CASE 
        WHEN (experiencia::DECIMAL / (nivel * 1000)) * 100 > 80 THEN 'Cerca de subir'
        ELSE 'En progreso'
    END AS estado
FROM jugadores
ORDER BY porcentaje_progreso DESC;

-- 7.3 Sistema de Matchmaking de Clanes
WITH stats_clanes AS (
    SELECT 
        c.id_clan,
        c.nombre_clan,
        COUNT(j.id_jugador) AS total_miembros,
        ROUND(AVG(j.nivel), 2) AS nivel_promedio
    FROM clanes c
    JOIN jugadores j ON c.id_clan = j.clan_id
    GROUP BY c.id_clan, c.nombre_clan
)
SELECT 
    c1.nombre_clan AS clan_1,
    c2.nombre_clan AS clan_2,
    c1.total_miembros AS miembros_clan1,
    c2.total_miembros AS miembros_clan2,
    c1.nivel_promedio AS nivel_clan1,
    c2.nivel_promedio AS nivel_clan2,
    ABS(c1.nivel_promedio - c2.nivel_promedio) AS diferencia_nivel,
    ABS(c1.total_miembros - c2.total_miembros) AS diferencia_miembros
FROM stats_clanes c1
JOIN stats_clanes c2 ON c1.id_clan < c2.id_clan
WHERE ABS(c1.nivel_promedio - c2.nivel_promedio) < 2
  AND ABS(c1.total_miembros - c2.total_miembros) < 3
ORDER BY diferencia_nivel, diferencia_miembros;

-- 7.4 Detección de Jugadores Inactivos
SELECT 
    j.nombre_jugador,
    j.nivel,
    COALESCE(TO_CHAR(MAX(jm.fecha_completada), 'YYYY-MM-DD'), 'Nunca') AS ultima_actividad,
    CASE 
        WHEN MAX(jm.fecha_completada) IS NULL THEN 'Sin actividad'
        WHEN MAX(jm.fecha_completada) < CURRENT_DATE - INTERVAL '30 days' THEN 'Inactivo'
        ELSE 'Activo'
    END AS estado
FROM jugadores j
LEFT JOIN jugadores_misiones jm ON j.id_jugador = jm.id_jugador AND jm.completada = TRUE
GROUP BY j.id_jugador, j.nombre_jugador, j.nivel
HAVING MAX(jm.fecha_completada) IS NULL 
    OR MAX(jm.fecha_completada) < CURRENT_DATE - INTERVAL '30 days'
ORDER BY ultima_actividad DESC;

-- 7.5 Sistema de Logros
WITH logros AS (
    SELECT 
        j.id_jugador,
        j.nombre_jugador,
        CASE WHEN COUNT(DISTINCT CASE WHEN e.tipo = 'arma' THEN e.id_equipamiento END) > 3 
             THEN 'Maestro de Armas' END AS logro_armas,
        CASE WHEN EXISTS (
            SELECT 1 FROM jugadores_misiones jm
            JOIN misiones m ON jm.id_mision = m.id_mision
            JOIN monstruos mo ON m.monstruo_id = mo.id_monstruo
            WHERE jm.id_jugador = j.id_jugador 
              AND mo.tipo_monstruo = 'dragón' 
              AND jm.completada = TRUE
        ) THEN 'Cazador de Dragones' END AS logro_dragon,
        CASE WHEN EXISTS (
            SELECT 1 FROM clanes c WHERE c.lider_id = j.id_jugador
        ) THEN 'Líder Nato' END AS logro_lider,
        CASE WHEN j.nivel >= 12 THEN 'Veterano' END AS logro_veterano
    FROM jugadores j
    LEFT JOIN jugadores_equipamientos je ON j.id_jugador = je.id_jugador
    LEFT JOIN equipamientos e ON je.id_equipamiento = e.id_equipamiento
    GROUP BY j.id_jugador, j.nombre_jugador, j.nivel
)
SELECT 
    nombre_jugador,
    CONCAT_WS(', ', 
        logro_armas, 
        logro_dragon, 
        logro_lider, 
        logro_veterano
    ) AS logros_obtenidos
FROM logros
WHERE logro_armas IS NOT NULL 
   OR logro_dragon IS NOT NULL 
   OR logro_lider IS NOT NULL 
   OR logro_veterano IS NOT NULL
ORDER BY nombre_jugador;

-- =====================================================
-- FIN DE LAS SOLUCIONES
-- =====================================================

/*
NOTAS ADICIONALES:

1. Algunas consultas pueden requerir ajustes según los datos específicos
2. Los procedimientos y funciones están optimizados para PostgreSQL
3. Se recomienda crear índices adicionales según el uso real
4. Las consultas complejas pueden beneficiarse de vistas materializadas

CONSEJOS PARA MEJORAR:
- Practica modificando las consultas
- Experimenta con diferentes combinaciones de JOINs
- Intenta optimizar las consultas más lentas
- Crea tus propios desafíos adicionales

¡FELICIDADES POR COMPLETAR EL CURSO!
*/
