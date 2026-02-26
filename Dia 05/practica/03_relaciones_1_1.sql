-- =====================================================
-- PRÁCTICA: RELACIONES 1-1 (Uno a Uno)
-- =====================================================

-- Ejemplo: Un hotel tiene un gerente (relación uno a uno)
CREATE TABLE gerentes (
    id_gerente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    id_hotel INTEGER UNIQUE NOT NULL,  -- UNIQUE garantiza 1-1
    FOREIGN KEY (id_hotel) REFERENCES hoteles(id_hotel)
);

-- Insertar datos
INSERT INTO hoteles (nombre, ciudad, estrellas) VALUES
    ('Hotel Mediterráneo', 'Barcelona', 4),
    ('Gran Hotel Central', 'Madrid', 5);

INSERT INTO gerentes (nombre, email, telefono, id_hotel) VALUES
    ('Roberto García', 'roberto@hotel.com', '600111222', 1),
    ('Carmen López', 'carmen@hotel.com', '600333444', 2);

-- Consultar relación 1-1
SELECT 
    h.nombre AS hotel,
    g.nombre AS gerente,
    g.email,
    g.telefono
FROM hoteles h
JOIN gerentes g ON h.id_hotel = g.id_hotel;

-- Características de relación 1-1:
-- 1. UNIQUE en la foreign key
-- 2. Un registro de tabla A se relaciona con máximo un registro de tabla B
-- 3. Útil para separar información opcional o sensible
