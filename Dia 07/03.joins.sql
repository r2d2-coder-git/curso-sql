-- Consultar los jugadores que han completado la misión más difícil:

SELECT J.nombre_jugador
FROM Jugadores J
JOIN Jugadores_Misiones JM ON J.id_jugador = JM.id_jugador
JOIN Misiones M ON JM.id_mision = M.id_mision
WHERE M.dificultad = 'dificil' AND JM.completada = TRUE;

-- Obtener las habilidades que tienen los jugadores de un clan específico:

SELECT J.nombre_jugador, H.nombre_habilidad, JH.nivel_habilidad
FROM Jugadores J
JOIN Jugadores_Habilidades JH ON J.id_jugador = JH.id_jugador
JOIN Habilidades H ON JH.id_habilidad = H.id_habilidad
WHERE J.clan_id = 1;  -- Clan específico

-- Listar los jugadores que han obtenido una espada como recompensa:

SELECT J.nombre_jugador
FROM Jugadores J
JOIN Jugadores_Recompensas JR ON J.id_jugador = JR.id_jugador
JOIN Recompensas R ON JR.id_recompensa = R.id_recompensa
WHERE R.tipo_recompensa = 'espada';
