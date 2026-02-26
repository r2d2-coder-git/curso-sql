-- =====================================================
-- PRÁCTICA: INNER, LEFT, RIGHT, FULL JOIN
-- =====================================================

-- INNER JOIN: Solo registros que coinciden en ambas tablas
SELECT 
    r.id_reserva,
    h.nombre AS huesped,
    r.fecha_entrada,
    r.fecha_salida,
    r.total
FROM reservas r
INNER JOIN huespedes h ON r.id_huesped = h.id_huesped;

-- LEFT JOIN: Todos los registros de la tabla izquierda
-- Incluye hoteles sin reservas
SELECT 
    hot.nombre AS hotel,
    COUNT(r.id_reserva) AS total_reservas
FROM hoteles hot
LEFT JOIN habitaciones hab ON hot.id_hotel = hab.id_hotel
LEFT JOIN reservas r ON hab.id_habitacion = r.id_habitacion
GROUP BY hot.id_hotel, hot.nombre;

-- Encontrar huéspedes sin reservas
SELECT h.nombre, h.email
FROM huespedes h
LEFT JOIN reservas r ON h.id_huesped = r.id_huesped
WHERE r.id_reserva IS NULL;

-- RIGHT JOIN: Todos los registros de la tabla derecha
SELECT 
    h.nombre AS huesped,
    r.fecha_entrada,
    r.total
FROM reservas r
RIGHT JOIN huespedes h ON r.id_huesped = h.id_huesped;

-- FULL JOIN: Todos los registros de ambas tablas
SELECT 
    hot.nombre AS hotel,
    hue.nombre AS huesped,
    r.fecha_entrada
FROM hoteles hot
FULL JOIN habitaciones hab ON hot.id_hotel = hab.id_hotel
FULL JOIN reservas r ON hab.id_habitacion = r.id_habitacion
FULL JOIN huespedes hue ON r.id_huesped = hue.id_huesped;

-- JOIN múltiple con información completa
SELECT 
    hot.nombre AS hotel,
    hab.numero_habitacion,
    hab.tipo,
    hue.nombre AS huesped,
    r.fecha_entrada,
    r.fecha_salida,
    r.total
FROM reservas r
INNER JOIN habitaciones hab ON r.id_habitacion = hab.id_habitacion
INNER JOIN hoteles hot ON hab.id_hotel = hot.id_hotel
INNER JOIN huespedes hue ON r.id_huesped = hue.id_huesped
ORDER BY r.fecha_entrada DESC;
