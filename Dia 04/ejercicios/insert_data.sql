-- =====================================================
-- DATOS PARA EJERCICIOS DEL DÍA 4
-- =====================================================

-- Asegurarse de usar el esquema dia04

-- EJERCICIO 1: Sistema de Ventas Online
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INTEGER,
    fecha_pedido DATE,
    total DECIMAL(10,2),
    estado VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (nombre, ciudad, pais) VALUES
    ('Juan Pérez', 'Madrid', 'España'),
    ('María García', 'Barcelona', 'España'),
    ('Carlos López', 'Lisboa', 'Portugal'),
    ('Ana Martínez', 'París', 'Francia'),
    ('Pedro Sánchez', 'Madrid', 'España');

INSERT INTO pedidos (id_cliente, fecha_pedido, total, estado) VALUES
    (1, '2024-01-15', 250.00, 'Entregado'),
    (1, '2024-02-20', 180.50, 'Entregado'),
    (2, '2024-01-10', 450.00, 'Entregado'),
    (2, '2024-02-15', 320.00, 'Enviado'),
    (3, '2024-01-25', 150.00, 'Entregado'),
    (4, '2024-02-01', 680.00, 'Entregado'),
    (4, '2024-02-10', 290.00, 'Pendiente'),
    (5, '2024-01-18', 95.00, 'Entregado'),
    (1, '2024-02-28', 420.00, 'Enviado'),
    (3, '2024-02-22', 210.00, 'Entregado');

-- EJERCICIO 2: Análisis de Rendimiento de Empleados
CREATE TABLE IF NOT EXISTS departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre_departamento VARCHAR(50),
    presupuesto DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS empleados_ventas (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    id_departamento INTEGER,
    fecha_contratacion DATE,
    ventas_mes DECIMAL(10,2),
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

INSERT INTO departamentos (nombre_departamento, presupuesto) VALUES
    ('Ventas Norte', 50000.00),
    ('Ventas Sur', 45000.00),
    ('Ventas Este', 48000.00);

INSERT INTO empleados_ventas (nombre, id_departamento, fecha_contratacion, ventas_mes) VALUES
    ('Laura Gómez', 1, '2020-03-15', 6500.00),
    ('Miguel Torres', 1, '2021-06-20', 7200.00),
    ('Carmen Ruiz', 1, '2019-01-10', 5800.00),
    ('David Moreno', 1, '2022-09-05', 4900.00),
    ('Isabel Fernández', 2, '2020-07-12', 5500.00),
    ('Roberto Díaz', 2, '2021-11-18', 6100.00),
    ('Patricia Vega', 2, '2022-02-25', 4700.00),
    ('Javier Castro', 2, '2019-05-30', 6800.00),
    ('Elena Romero', 3, '2020-10-08', 5900.00),
    ('Francisco Gil', 3, '2021-04-14', 6400.00),
    ('Marta Navarro', 3, '2022-08-22', 5200.00),
    ('Alberto Sanz', 3, '2019-12-01', 7100.00);
