-- Relación 1 a N entre jugadores y clanes 
-- (1 jugador puede tener un clan y un clan puede tener muchos jugadores) 
CREATE TABLE jugadores (
    id_jugador INT PRIMARY KEY,
    nombre_jugador VARCHAR(100),
    nivel INT DEFAULT 1,
    experiencia INT DEFAULT 0,
    clan_id INT,
    FOREIGN KEY (clan_id) REFERENCES clanes(id_clan)
);

-- Relación 1 a 1 
-- (Un clan tiene un lider de jugador y sólo un jugador puede liderar un clan.)
CREATE TABLE clanes (
    id_clan INT PRIMARY KEY,
    nombre_clan VARCHAR(100),
    fecha_creacion DATE,
    FOREIGN KEY (lider_id) REFERENCES jugadores(id_jugador)
);

-- Relación 1 a 1 entre misión y recompensa
-- (Una misión puede tener una recompensa y una recompensa sólo puede estar en una misión)

--Relación 1 a 1 entre misión y monstruo
-- (Una misión puede tener un monstruo y un monstruo sólo puede estar en una misión)
CREATE TABLE misiones (
    id_mision INT PRIMARY KEY,
    nombre_mision VARCHAR(100),
    dificultad VARCHAR(50),
    recompensa_xp INT,  -- Experiencia ganada
    recompensa_oro INT  -- Oro ganado
    FOREIGN KEY (recompensa_objeto) REFERENCES recompensa(id_recompensa)
    FOREIGN KEY (monstruo) REFERENCES monstruos(id_monstruo)
);

-- Relación 1 a N entre monstruos y recompensas
-- (Un monstruo puede tener una única recompensa y una recompensa puede darse en mucho monstruos)
CREATE TABLE monstruos (
    id_monstruo INT PRIMARY KEY,
    nombre_monstruo VARCHAR(100),
    nivel_monstruo INT,
    vida INT,
    tipo_monstruo VARCHAR(50)  -- Por ejemplo, "dragón", "esqueleto", "demonio"
    FOREIGN KEY (recompensa_objeto) REFERENCES recompensa(id_recompensa)
);

CREATE TABLE equipamiento (
    id_equipamiento INT PRIMARY KEY,
    nombre_equipamiento VARCHAR(100),
    tipo VARCHAR(50),  -- Ej: "arma", "armadura", "anillo"
    nivel_requerido INT,  -- Nivel mínimo para usarlo
    bono_ataque INT DEFAULT 0,
    bono_defensa INT DEFAULT 0
);

CREATE TABLE recompensas (
    id_recompensa INT PRIMARY KEY,
    tipo_recompensa VARCHAR(100),  -- Ejemplo: "oro", "poción", "espada"
    descripcion_recompensa VARCHAR(255)
);

-- Relacion N - N entre jugadores y misiones 
-- (Un jugador puede tener muchas misiones y una misión la puede tener muchos jugadores)

CREATE TABLE jugadores_misiones (
    id_jugador INT,
    id_mision INT,
    fecha_completada DATE,
    completada BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_jugador, id_mision),
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador),
    FOREIGN KEY (id_mision) REFERENCES Misiones(id_mision)
);

-- Relacion N - N entre jugadores y recompensas 
-- (Un jugador puede tener muchas recompensas y una recompensa la puede tener muchos jugadores)

CREATE TABLE jugadores_recompensas (
    id_jugador INT,
    id_recompensa INT,
    fecha_obtenida DATE,
    PRIMARY KEY (id_jugador, id_recompensa),
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador),
    FOREIGN KEY (id_recompensa) REFERENCES Recompensas(id_recompensa)
);

-- Relacion N - N entre jugadores y equipamiento 
-- (Un jugador puede tener muchos equipamientos y un equipamiento lo puede tener muchos jugadores)

CREATE TABLE jugadores_equipamientos (
    id_jugador INT,
    id_equipamiento INT,
    cantidad INT DEFAULT 1,
    PRIMARY KEY (id_jugador, id_habilidad),
    FOREIGN KEY (id_jugador) REFERENCES Jugadores(id_jugador),
    FOREIGN KEY (id_habilidad) REFERENCES Habilidades(id_habilidad)
);
