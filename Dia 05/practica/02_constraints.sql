-- =====================================================
-- PRÁCTICA: CONSTRAINTS (Restricciones)
-- =====================================================

CREATE TABLE huespedes (
    id_huesped SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,  -- NOT NULL: campo obligatorio
    email VARCHAR(100) UNIQUE,     -- UNIQUE: valor único
    telefono VARCHAR(20),
    edad INTEGER CHECK (edad >= 18),  -- CHECK: validación personalizada
    fecha_registro DATE DEFAULT CURRENT_DATE  -- DEFAULT: valor por defecto
);

-- Agregar constraint después de crear la tabla
ALTER TABLE reservas 
ADD CONSTRAINT check_fechas CHECK (fecha_salida > fecha_entrada);

-- Constraint UNIQUE compuesto
ALTER TABLE habitaciones 
ADD CONSTRAINT unique_habitacion UNIQUE (id_hotel, numero_habitacion);

-- Constraint CHECK con múltiples condiciones
ALTER TABLE habitaciones
ADD CONSTRAINT check_precio CHECK (precio_noche > 0 AND precio_noche < 10000);

-- Constraint con nombre personalizado
ALTER TABLE huespedes
ADD CONSTRAINT email_valido CHECK (email LIKE '%@%');

-- Ver constraints de una tabla
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'huespedes';

-- Eliminar un constraint
-- ALTER TABLE huespedes DROP CONSTRAINT email_valido;

-- Deshabilitar temporalmente un constraint
-- ALTER TABLE reservas DISABLE TRIGGER ALL;
-- ALTER TABLE reservas ENABLE TRIGGER ALL;
