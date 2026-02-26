-- =====================================================
-- PRÁCTICA: Funciones en PostgreSQL
-- =====================================================

-- Función que devuelve un valor
CREATE OR REPLACE FUNCTION calcular_descuento(
    precio DECIMAL,
    porcentaje INTEGER
)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN precio - (precio * porcentaje / 100);
END;
$$;

-- Usar la función
SELECT 
    nombre,
    precio,
    calcular_descuento(precio, 10) AS precio_con_descuento
FROM productos_tienda;

-- Función que devuelve una tabla
CREATE OR REPLACE FUNCTION productos_por_categoria(cat VARCHAR)
RETURNS TABLE (
    nombre VARCHAR,
    precio DECIMAL,
    stock INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT p.nombre, p.precio, p.stock
    FROM productos_tienda p
    WHERE p.categoria = cat;
END;
$$;

-- Usar la función
SELECT * FROM productos_por_categoria('Electrónica');

-- Función con lógica compleja
CREATE OR REPLACE FUNCTION calcular_iva(
    precio DECIMAL,
    tipo_iva VARCHAR DEFAULT 'general'
)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    porcentaje DECIMAL;
BEGIN
    CASE tipo_iva
        WHEN 'general' THEN porcentaje := 0.21;
        WHEN 'reducido' THEN porcentaje := 0.10;
        WHEN 'superreducido' THEN porcentaje := 0.04;
        ELSE porcentaje := 0.21;
    END CASE;
    
    RETURN precio * (1 + porcentaje);
END;
$$;

-- Función que cuenta registros
CREATE OR REPLACE FUNCTION contar_productos_categoria(cat VARCHAR)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    total INTEGER;
BEGIN
    SELECT COUNT(*) INTO total
    FROM productos_tienda
    WHERE categoria = cat;
    
    RETURN total;
END;
$$;

-- Ver funciones creadas
SELECT routine_name, routine_type
FROM information_schema.routines
WHERE routine_schema = 'public' AND routine_type = 'FUNCTION';
