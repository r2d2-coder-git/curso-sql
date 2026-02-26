-- =====================================================
-- PRÁCTICA: Exploramos el sistema gestor de PostgreSQL
-- =====================================================

-- Ver la versión de PostgreSQL instalada
SELECT version();

-- Listar todas las bases de datos disponibles
-- Comando en psql: \l
-- Equivalente SQL:
SELECT datname FROM pg_database;

-- Crear nuestra primera base de datos
CREATE DATABASE biblioteca_municipal;

-- Conectarse a la base de datos
-- Comando en psql: \c biblioteca_municipal

-- Listar todas las tablas de la base de datos actual
-- Comando en psql: \dt
-- Equivalente SQL:
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

-- Ver información sobre una tabla específica
-- Comando en psql: \d nombre_tabla
-- Equivalente SQL (ejemplo con una tabla):
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'nombre_tabla';

-- Listar todos los esquemas
-- Comando en psql: \dn
SELECT schema_name 
FROM information_schema.schemata;

-- Ver el esquema actual
SELECT current_schema();

-- Ver todos los usuarios/roles
-- Comando en psql: \du
SELECT usename AS role_name,
       CASE 
           WHEN usesuper THEN 'superuser'
           ELSE 'normal user'
       END AS role_type
FROM pg_user;

-- Obtener ayuda sobre comandos SQL
-- Comando en psql: \h CREATE TABLE

-- Ver la base de datos actual
SELECT current_database();

-- Salir de psql
-- Comando: \q

-- =====================================================
-- CONCEPTOS CLAVE:
-- - Base de datos: biblioteca_municipal (contenedor principal)
-- - Tablas: estructuras que crearemos en los próximos días
-- - Filas: cada libro, usuario o préstamo será una fila
-- - Columnas: título, autor, fecha_prestamo, etc.
-- =====================================================
