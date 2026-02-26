-- =====================================================
-- PRÁCTICA: RELACIONES 1-N (Uno a Muchos)
-- =====================================================

-- Ejemplo: Un hotel tiene muchas habitaciones
-- Ya implementado en la tabla habitaciones:
-- Un hotel (1) puede tener muchas habitaciones (N)

INSERT INTO habitaciones (id_hotel, numero_habitacion, tipo, precio_noche) VALUES
    (1, '101', 'Individual', 80.00),
    (1, '102', 'Doble', 120.00),
    (1, '201', 'Suite', 200.00),
    (2, '101', 'Doble', 150.00),
    (2, '102', 'Suite', 300.00);

-- Consultar relación 1-N
SELECT 
    h.nombre AS hotel,
    hab.numero_habitacion,
    hab.tipo,
    hab.precio_noche
FROM hoteles h
JOIN habitaciones hab ON h.id_hotel = hab.id_hotel
ORDER BY h.nombre, hab.numero_habitacion;

-- Contar habitaciones por hotel
SELECT 
    h.nombre AS hotel,
    COUNT(hab.id_habitacion) AS total_habitaciones,
    AVG(hab.precio_noche) AS precio_promedio
FROM hoteles h
LEFT JOIN habitaciones hab ON h.id_hotel = hab.id_hotel
GROUP BY h.id_hotel, h.nombre;

-- Ejemplo 2: Un huésped puede tener muchas reservas
INSERT INTO huespedes (nombre, email, telefono, edad) VALUES
    ('María González', 'maria.g@email.com', '600111222', 35),
    ('Juan Pérez', 'juan.p@email.com', '600333444', 42);

INSERT INTO reservas (id_habitacion, id_huesped, fecha_entrada, fecha_salida, total) VALUES
    (1, 1, '2024-03-15', '2024-03-18', 240.00),
    (2, 1, '2024-04-20', '2024-04-25', 600.00),
    (4, 2, '2024-04-01', '2024-04-05', 600.00);

-- Características de relación 1-N:
-- 1. La más común en bases de datos
-- 2. La tabla "muchos" tiene foreign key a la tabla "uno"
-- 3. Un registro padre puede tener múltiples registros hijos
