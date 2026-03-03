-- =====================================================
-- DÍA 7: CREAR ESQUEMA Y TABLAS - PROYECTO FINAL
-- Sistema de Juego RPG
-- =====================================================

-- Crear esquema para el día 7
CREATE SCHEMA IF NOT EXISTS dia07;

-- Establecer el esquema como predeterminado para esta sesión

-- =====================================================
-- TABLAS PRINCIPALES
-- =====================================================

-- Tabla de jugadores
CREATE TABLE dia07.jugadores (
    id_jugador INT PRIMARY KEY,
    nombre_jugador VARCHAR(100),
    nivel INT DEFAULT 1,
    experiencia INT DEFAULT 0,
    clan_id INT
);

-- Tabla de clanes
CREATE TABLE dia07.clanes (
    id_clan INT PRIMARY KEY,
    nombre_clan VARCHAR(100),
    fecha_creacion DATE,
    lider_id INT,
    FOREIGN KEY (lider_id) REFERENCES dia07.jugadores(id_jugador)
);

-- Agregar foreign key de jugadores a clanes
ALTER TABLE dia07.jugadores
ADD CONSTRAINT fk_clan
FOREIGN KEY (clan_id) REFERENCES dia07.clanes(id_clan);

-- Tabla de equipamiento
CREATE TABLE dia07.equipamientos (
    id_equipamiento INT PRIMARY KEY,
    nombre_equipamiento VARCHAR(100),
    tipo VARCHAR(50),
    nivel_requerido INT,
    bono_ataque INT DEFAULT 0,
    bono_defensa INT DEFAULT 0
);

-- Tabla de recompensas
CREATE TABLE dia07.recompensas (
    id_recompensa INT PRIMARY KEY,
    tipo_recompensa VARCHAR(100),
    descripcion_recompensa VARCHAR(255)
);

-- Tabla de monstruos
CREATE TABLE dia07.monstruos (
    id_monstruo INT PRIMARY KEY,
    nombre_monstruo VARCHAR(100),
    nivel_monstruo INT,
    vida INT,
    tipo_monstruo VARCHAR(50),
    recompensa_id INT,
    FOREIGN KEY (recompensa_id) REFERENCES dia07.recompensas(id_recompensa)
);

-- Tabla de misiones
CREATE TABLE dia07.misiones (
    id_mision INT PRIMARY KEY,
    nombre_mision VARCHAR(100),
    dificultad VARCHAR(50),
    recompensa_xp INT,
    recompensa_oro INT,
    recompensa_id INT,
    monstruo_id INT,
    FOREIGN KEY (recompensa_id) REFERENCES dia07.recompensas(id_recompensa),
    FOREIGN KEY (monstruo_id) REFERENCES dia07.monstruos(id_monstruo)
);

-- =====================================================
-- TABLAS DE RELACIÓN N-N
-- =====================================================

-- Relación jugadores - misiones
CREATE TABLE dia07.jugadores_misiones (
    id_jugador INT,
    id_mision INT,
    fecha_completada DATE,
    completada BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_jugador, id_mision),
    FOREIGN KEY (id_jugador) REFERENCES dia07.jugadores(id_jugador),
    FOREIGN KEY (id_mision) REFERENCES dia07.misiones(id_mision)
);

-- Relación jugadores - recompensas
CREATE TABLE dia07.jugadores_recompensas (
    id_jugador INT,
    id_recompensa INT,
    fecha_obtenida DATE,
    PRIMARY KEY (id_jugador, id_recompensa),
    FOREIGN KEY (id_jugador) REFERENCES dia07.jugadores(id_jugador),
    FOREIGN KEY (id_recompensa) REFERENCES dia07.recompensas(id_recompensa)
);

-- Relación jugadores - equipamiento
CREATE TABLE dia07.jugadores_equipamientos (
    id_jugador INT,
    id_equipamiento INT,
    cantidad INT DEFAULT 1,
    PRIMARY KEY (id_jugador, id_equipamiento),
    FOREIGN KEY (id_jugador) REFERENCES dia07.jugadores(id_jugador),
    FOREIGN KEY (id_equipamiento) REFERENCES dia07.equipamientos(id_equipamiento)
);

-- =====================================================
-- VERIFICAR TABLAS CREADAS
-- =====================================================

-- Ver todas las tablas del esquema dia07
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'dia07'
ORDER BY table_name;

-- Ver las relaciones entre tablas
SELECT
    tc.table_name, 
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM information_schema.table_constraints AS tc 
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY' 
    AND tc.table_schema = 'dia07'
ORDER BY tc.table_name;

-- Para usar este esquema en futuras sesiones:
-- SET search_path TO dia07;
