-- =====================================================
-- PRÁCTICA: Instalación de PostgreSQL
-- =====================================================

-- PASOS PARA INSTALAR POSTGRESQL:

-- 1. Descargar PostgreSQL desde: https://www.postgresql.org/download/
-- 2. Ejecutar el instalador
-- 3. Durante la instalación:
--    - Elegir directorio de instalación
--    - Seleccionar componentes (PostgreSQL Server, pgAdmin 4, Command Line Tools)
--    - Elegir directorio de datos
--    - Establecer contraseña para el usuario 'postgres'
--    - Elegir puerto (por defecto: 5432)
--    - Seleccionar locale

-- 4. Verificar la instalación:
--    - Abrir terminal/cmd
--    - Ejecutar: psql --version

-- 5. Conectarse a PostgreSQL:
--    - Ejecutar: psql -U postgres
--    - Introducir la contraseña establecida

-- COMANDOS BÁSICOS DE CONEXIÓN:

-- Conectar a PostgreSQL (desde terminal)
-- psql -U postgres -h localhost -p 5432

-- Conectar a una base de datos específica
-- psql -U postgres -d nombre_base_datos

-- Ver ayuda
-- psql --help
