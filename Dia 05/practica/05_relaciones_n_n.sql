-- =====================================================
-- PRÁCTICA: RELACIONES N-N (Muchos a Muchos)
-- =====================================================

-- Ejemplo: Servicios del hotel
-- Un hotel puede tener muchos servicios
-- Un servicio puede estar en muchos hoteles

CREATE TABLE servicios (
    id_servicio SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla intermedia (junction table)
CREATE TABLE hotel_servicios (
    id_hotel INTEGER NOT NULL,
    id_servicio INTEGER NOT NULL,
    fecha_implementacion DATE,
    PRIMARY KEY (id_hotel, id_servicio),
    FOREIGN KEY (id_hotel) REFERENCES hoteles(id_hotel),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

-- Insertar servicios
INSERT INTO servicios (nombre, descripcion) VALUES
    ('WiFi', 'Internet inalámbrico gratuito'),
    ('Piscina', 'Piscina al aire libre'),
    ('Gimnasio', 'Gimnasio 24 horas'),
    ('Spa', 'Centro de bienestar y spa'),
    ('Parking', 'Aparcamiento privado');

-- Asignar servicios a hoteles
INSERT INTO hotel_servicios (id_hotel, id_servicio, fecha_implementacion) VALUES
    (1, 1, '2020-01-01'),  -- Hotel 1 tiene WiFi
    (1, 2, '2020-01-01'),  -- Hotel 1 tiene Piscina
    (1, 3, '2021-06-15'),  -- Hotel 1 tiene Gimnasio
    (2, 1, '2019-01-01'),  -- Hotel 2 tiene WiFi
    (2, 3, '2019-01-01'),  -- Hotel 2 tiene Gimnasio
    (2, 4, '2020-03-20');  -- Hotel 2 tiene Spa

-- Consultar servicios de cada hotel
SELECT 
    h.nombre AS hotel,
    s.nombre AS servicio,
    s.descripcion
FROM hoteles h
JOIN hotel_servicios hs ON h.id_hotel = hs.id_hotel
JOIN servicios s ON hs.id_servicio = s.id_servicio
ORDER BY h.nombre, s.nombre;

-- Contar servicios por hotel
SELECT 
    h.nombre AS hotel,
    COUNT(hs.id_servicio) AS total_servicios
FROM hoteles h
LEFT JOIN hotel_servicios hs ON h.id_hotel = hs.id_hotel
GROUP BY h.id_hotel, h.nombre;

-- Hoteles que tienen un servicio específico
SELECT h.nombre
FROM hoteles h
JOIN hotel_servicios hs ON h.id_hotel = hs.id_hotel
JOIN servicios s ON hs.id_servicio = s.id_servicio
WHERE s.nombre = 'Spa';

-- Características de relación N-N:
-- 1. Requiere tabla intermedia (junction table)
-- 2. La tabla intermedia tiene foreign keys a ambas tablas
-- 3. Primary key compuesta en la tabla intermedia
-- 4. Puede incluir atributos adicionales (fecha_implementacion)
