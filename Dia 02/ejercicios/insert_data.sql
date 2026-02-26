-- =====================================================
-- DATOS PARA EJERCICIOS DEL DÍA 2
-- =====================================================

-- EJERCICIO 1: Gestión de Productos de una Tienda
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    precio DECIMAL(8,2),
    stock INTEGER
);

INSERT INTO productos (nombre, marca, precio, stock) VALUES
    ('Laptop Dell', 'Dell', 899.99, 15),
    ('Mouse Inalámbrico', 'Logitech', 25.50, 50),
    ('Teclado Mecánico', 'Corsair', 120.00, 30),
    ('Monitor 24"', 'Samsung', 180.00, 20),
    ('Webcam HD', 'Logitech', 65.00, 0),
    ('Auriculares Bluetooth', 'Sony', 89.99, 45),
    ('Disco Duro 1TB', 'Western Digital', 55.00, 100),
    ('Memoria RAM 16GB', 'Kingston', 75.00, 60);

-- EJERCICIO 2: Sistema de Gestión de Empleados
CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    activo BOOLEAN DEFAULT true
);

INSERT INTO empleados (nombre_completo, departamento, salario, fecha_contratacion, activo) VALUES
    ('Ana García López', 'Ventas', 28000.00, '2023-01-15', true),
    ('Carlos Martínez Ruiz', 'IT', 35000.00, '2022-06-20', true),
    ('Laura Fernández Soto', 'Marketing', 30000.00, '2023-03-10', true),
    ('Miguel Ángel Torres', 'IT', 38000.00, '2021-11-05', true),
    ('Isabel Romero Díaz', 'Recursos Humanos', 32000.00, '2023-07-01', false),
    ('Pedro Sánchez Mora', 'Ventas', 26000.00, '2023-02-20', true),
    ('Lucía Martín Vega', 'IT', 36000.00, '2022-09-15', true),
    ('Roberto Gil Navarro', 'Marketing', 29000.00, '2023-05-10', true);
