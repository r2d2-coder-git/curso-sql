-- =====================================================
-- PRÁCTICA: PRIMARY KEY y FOREIGN KEY
-- =====================================================

-- PRIMARY KEY: Identifica únicamente cada registro
CREATE TABLE hoteles (
    id_hotel SERIAL PRIMARY KEY,  -- Clave primaria autoincremental
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    estrellas INTEGER CHECK (estrellas BETWEEN 1 AND 5)
);

-- FOREIGN KEY: Relaciona tablas
CREATE TABLE habitaciones (
    id_habitacion SERIAL PRIMARY KEY,
    id_hotel INTEGER NOT NULL,
    numero_habitacion VARCHAR(10) NOT NULL,
    tipo VARCHAR(50),
    precio_noche DECIMAL(6,2),
    FOREIGN KEY (id_hotel) REFERENCES hoteles(id_hotel)
);

-- Múltiples FOREIGN KEYS
CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_habitacion INTEGER NOT NULL,
    id_huesped INTEGER NOT NULL,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    total DECIMAL(8,2),
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion),
    FOREIGN KEY (id_huesped) REFERENCES huespedes(id_huesped)
);

-- PRIMARY KEY compuesta
CREATE TABLE hotel_servicios (
    id_hotel INTEGER NOT NULL,
    id_servicio INTEGER NOT NULL,
    PRIMARY KEY (id_hotel, id_servicio),
    FOREIGN KEY (id_hotel) REFERENCES hoteles(id_hotel),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

-- FOREIGN KEY con acciones
CREATE TABLE comentarios (
    id_comentario SERIAL PRIMARY KEY,
    id_hotel INTEGER,
    comentario TEXT,
    FOREIGN KEY (id_hotel) REFERENCES hoteles(id_hotel)
        ON DELETE CASCADE  -- Si se borra el hotel, se borran sus comentarios
        ON UPDATE CASCADE  -- Si se actualiza el id, se actualiza aquí también
);
