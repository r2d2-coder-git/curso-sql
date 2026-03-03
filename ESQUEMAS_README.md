# Guía de Uso de Esquemas por Día

Este curso utiliza esquemas de PostgreSQL para organizar las tablas de cada día, evitando conflictos de nombres y manteniendo todo ordenado.

## ¿Qué es un Esquema?

Un esquema en PostgreSQL es como una carpeta que agrupa tablas relacionadas. Cada día del curso tiene su propio esquema:

- `dia02` - Restaurante (prácticas) + Ejercicios
- `dia03` - Videojuegos (prácticas) + Ejercicios
- `dia04` - Streaming de Música (prácticas) + Ejercicios
- `dia05` - Reservas de Hotel (prácticas) + Ejercicios
- `dia06` - E-commerce (prácticas) + Ejercicios
- `dia07` - Juego RPG (proyecto final)

## Estructura de Archivos

```
Dia XX/
├── 00_create_tables_schema.sql    <- Crea el esquema del día (ejecutar primero)
├── practica/
│   ├── 01_tema.sql         <- Incluye SET search_path TO diaXX
│   └── ...
└── ejercicios/
    ├── insert_data.sql
    ├── ejercicio_01.sql
    ├── ejercicio_02.sql
    ├── soluciones_ejercicio_01.sql
    └── soluciones_ejercicio_02.sql
```

## Flujo de Trabajo Recomendado

1. Crear el esquema del día
```sql
\i 'Dia 02/00_create_tables_schema.sql'
```

2. Cargar datos de prueba
```sql
\i 'Dia 02/ejercicios/insert_data.sql'
```

3. Trabajar con las prácticas
```sql
\i 'Dia 02/practica/01_create_drop_table.sql'
```

4. Resolver ejercicios
```sql
\i 'Dia 02/ejercicios/ejercicio_01.sql'
```

## Comandos Útiles

```sql
-- Ver todos los esquemas del curso
SELECT schema_name FROM information_schema.schemata WHERE schema_name LIKE 'dia%';

-- Ver tablas de un esquema
SELECT table_name FROM information_schema.tables WHERE table_schema = 'dia02';

-- Cambiar de esquema
SET search_path TO dia03;

-- Ver el esquema actual
SELECT current_schema();

-- Eliminar un esquema completo (cuidado!)
DROP SCHEMA dia02 CASCADE;
```

## Solución de Problemas

**"relation does not exist"** → Asegúrate de estar en el esquema correcto
```sql
SET search_path TO dia02;
```

**"schema does not exist"** → Ejecuta primero el archivo de esquema
```sql
\i 'Dia 02/00_create_tables_schema.sql'
```

**Empezar de cero**
```sql
DROP SCHEMA dia02 CASCADE;
\i 'Dia 02/00_create_tables_schema.sql'
```
