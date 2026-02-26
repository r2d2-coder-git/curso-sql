# 📚 Curso de SQL en 7 Días con PostgreSQL

Curso completo de SQL desde cero hasta nivel avanzado, diseñado para aprender PostgreSQL de forma práctica y progresiva.

## 🎯 Objetivo del Curso

Dominar SQL y PostgreSQL en 7 días mediante teoría, práctica guiada y ejercicios progresivos con datos reales y variados.

## 🗂️ Estructura del Curso

Cada día incluye:
- **Teoría**: Conceptos clave explicados
- **Práctica**: Archivos SQL separados por tema con ejemplos
- **Ejercicios**: 2 ejercicios completos con datos de prueba
- **Soluciones**: Respuestas detalladas de todos los ejercicios

---

## 📅 Día 1: Introducción a las Bases de Datos y SQL

### Teoría
- Conceptos clave: Base de datos, tablas, filas, columnas
- ¿Qué tipos de datos podemos almacenar en una base de datos?
- ¿Qué es un sistema gestor de base de datos?
- ¿Qué es SQL (Structured Query Language)?
- ¿Por qué es tan importante SQL en la programación? (Campos en los que se utiliza)

### Práctica
- `practica/01_instalacion_postgresql.sql` - Instalación de PostgreSQL
- `practica/02_exploracion_sistema.sql` - Exploramos el sistema gestor de PostgreSQL

### Ejercicios
- `ejercicios/ejercicio_01.sql` - Exploración del Sistema PostgreSQL
- `ejercicios/ejercicio_02.sql` - Comandos Básicos de Exploración

**Tema**: Biblioteca Municipal

---

## 📅 Día 2: Operaciones Básicas de SQL

### Práctica
- `practica/01_create_drop_table.sql` - Cómo creamos una tabla desde cero (CREATE/DROP TABLE)
- `practica/02_insert_into.sql` - Cómo insertamos datos en una tabla (INSERT INTO)
- `practica/03_select_from.sql` - Cómo seleccionamos datos con SQL (SELECT FROM)
- `practica/04_where_filtrado.sql` - Cómo filtramos datos con SQL (WHERE, LIKE, BETWEEN, IN)
- `practica/05_update_table.sql` - Cómo actualizamos datos en una tabla (UPDATE TABLE WHERE)
- `practica/06_delete_from.sql` - Cómo borramos datos en una tabla (DELETE FROM WHERE)
- `practica/07_comentarios.sql` - Cómo ponemos comentarios en SQL
- `practica/08_limit.sql` - Cómo limitamos los resultados de nuestras consultas (LIMIT)
- `practica/09_alias.sql` - Cómo renombramos columnas y tablas (ALIAS)
- `practica/10_orden_logico.sql` - Orden lógico de las consultas

### Teoría
- Filtrado de datos
- Operadores lógicos y de comparación (=, >, <, <>, LIKE, BETWEEN, IN)
- ¿Para qué sirven los comentarios en programación?
- ¿Por qué es importante limitar nuestras consultas?
- Hablemos de nombres y alias
- Orden lógico de las consultas

### Ejercicios
- `ejercicios/insert_data.sql` - Datos para los ejercicios
- `ejercicios/ejercicio_01.sql` - Gestión de Productos de una Tienda
- `ejercicios/ejercicio_02.sql` - Sistema de Gestión de Empleados
- `ejercicios/soluciones_ejercicio_01.sql` - Soluciones ejercicio 1
- `ejercicios/soluciones_ejercicio_02.sql` - Soluciones ejercicio 2

**Tema**: Restaurante

---

## 📅 Día 3: Operaciones Intermedias de SQL

### Práctica
- `practica/01_operaciones_fecha.sql` - OPERACIONES DE FECHA (NOW, CURRENT_DATE, CURRENT_TIME, EXTRACT)
- `practica/02_case_when.sql` - CASE WHEN
- `practica/03_order_by.sql` - ORDER BY
- `practica/04_group_by_count.sql` - GROUP BY COUNT (ERROR TÍPICO DE SELECT COLUMNAS SIN AGRUPAR)
- `practica/05_having.sql` - HAVING COUNT
- `practica/06_funciones_agregadas.sql` - MAX, MIN, LENGTH, AVERAGE
- `practica/07_distinct.sql` - DISTINCT
- `practica/08_manejo_nulos.sql` - ¿Cómo manejamos los nulos? (IS NULL, COALESCE)

### Teoría
- ¿Por qué son importantes las fechas en análisis de datos?
- Ordenación de datos
- Funciones de agrupación
- Funciones agregadas
- ¿Qué son los valores nulos?

### Ejercicios
- `ejercicios/insert_data.sql` - Datos para los ejercicios
- `ejercicios/ejercicio_01.sql` - Sistema de Gestión de Películas
- `ejercicios/ejercicio_02.sql` - Sistema de Registro de Estudiantes
- `ejercicios/soluciones_ejercicio_01.sql` - Soluciones ejercicio 1
- `ejercicios/soluciones_ejercicio_02.sql` - Soluciones ejercicio 2

**Tema**: Tienda de Videojuegos

---

## 📅 Día 4: Operaciones Avanzadas de SQL

### Práctica
- `practica/01_subconsultas.sql` - SUBCONSULTAS
- `practica/02_with_cte.sql` - WITH AS (Common Table Expressions)
- `practica/03_window_over.sql` - WINDOW Y OVER
- `practica/04_row_number.sql` - ROW_NUMBER
- `practica/05_dense_rank.sql` - DENSE_RANK
- `practica/06_lead_lag.sql` - LEAD Y LAG
- `practica/07_pivot.sql` - PIVOT

### Teoría
- ¿Cómo encadenamos consultas?
- Funciones de ventana
- Row number vs dense rank
- Lead vs lag
- Transposición de tablas

### Ejercicios
- `ejercicios/insert_data.sql` - Datos para los ejercicios
- `ejercicios/ejercicio_01.sql` - Sistema de Ventas Online
- `ejercicios/ejercicio_02.sql` - Análisis de Rendimiento de Empleados
- `ejercicios/soluciones_ejercicio_01.sql` - Soluciones ejercicio 1
- `ejercicios/soluciones_ejercicio_02.sql` - Soluciones ejercicio 2

**Tema**: Plataforma de Streaming de Música

---

## 📅 Día 5: Relaciones entre Tablas

### Práctica
- `practica/01_primary_foreign_keys.sql` - PRIMARY KEY y FOREIGN KEY
- `practica/02_constraints.sql` - CONSTRAINTS
- `practica/03_relaciones_1_1.sql` - RELACIONES 1-1
- `practica/04_relaciones_1_n.sql` - RELACIONES 1-N
- `practica/05_relaciones_n_n.sql` - RELACIONES N-N
- `practica/06_joins.sql` - LEFT, INNER, FULL JOIN
- `practica/07_union.sql` - UNION, UNION ALL

### Teoría
- Claves primarias y foráneas
- Restricciones de integridad
- Tipos de relaciones entre tablas
- Tipos de JOIN

### Ejercicios
- `ejercicios/insert_data.sql` - Datos para los ejercicios
- `ejercicios/ejercicio_01.sql` - Sistema de Biblioteca
- `ejercicios/ejercicio_02.sql` - Sistema de Gestión Universitaria
- `ejercicios/soluciones_ejercicio_01.sql` - Soluciones ejercicio 1
- `ejercicios/soluciones_ejercicio_02.sql` - Soluciones ejercicio 2

**Tema**: Sistema de Reservas de Hotel

---

## 📅 Día 6: Recursos Avanzados de SQL

### Práctica
- `practica/01_indices.sql` - INDICES
- `practica/02_stored_procedures.sql` - STORED PROCEDURES
- `practica/03_explain.sql` - EXPLAIN
- `practica/04_funciones.sql` - Funciones personalizadas
- `bbdd.py` - CONEXIÓN A BBDD CON PYTHON

### Teoría
- Consultas SQL más rápidas
- SQL como lenguaje de programación
- Las entrañas de una consulta SQL
- Más allá de SQL

### Ejercicios
- `ejercicios/insert_data.sql` - Datos para los ejercicios
- `ejercicios/ejercicio_01.sql` - Optimización de Base de Datos de Blog
- `ejercicios/ejercicio_02.sql` - Sistema de Inventario Avanzado
- `ejercicios/soluciones_ejercicio_01.sql` - Soluciones ejercicio 1
- `ejercicios/soluciones_ejercicio_02.sql` - Soluciones ejercicio 2

**Tema**: Sistema de E-commerce

---

## 📅 Día 7: Proyecto Final - Sistema de Juego RPG

### Descripción
Proyecto integrador que combina todos los conocimientos adquiridos en los 6 días anteriores. Sistema completo de gestión de un juego RPG con jugadores, clanes, misiones, monstruos, equipamiento y recompensas.

### Modelo de Datos
- **jugadores**: Información de jugadores (nivel, experiencia, clan)
- **clanes**: Grupos de jugadores con líderes
- **equipamientos**: Armas, armaduras y accesorios
- **recompensas**: Premios por completar misiones
- **monstruos**: Enemigos con diferentes características
- **misiones**: Desafíos con recompensas
- **Tablas de relación N-N**: jugadores_misiones, jugadores_equipamientos, jugadores_recompensas

### Archivos
- `01.creacion_tablas.sql` - Esquema completo de la base de datos
- `insert_data/` - 9 archivos con datos de prueba
- `proyecto_final_ejercicios.sql` - 70+ ejercicios integradores organizados en 7 secciones
- `proyecto_final_soluciones.sql` - Soluciones completas y detalladas

### Secciones de Ejercicios
1. **Consultas Básicas** (10 ejercicios) - Día 2
2. **Operaciones Intermedias** (10 ejercicios) - Día 3
3. **Operaciones Avanzadas** (10 ejercicios) - Día 4
4. **Relaciones y JOINs** (10 ejercicios) - Día 5
5. **Consultas Complejas Integradas** (10 ejercicios) - Integración
6. **Optimización y Procedimientos** (10 ejercicios) - Día 6
7. **Desafíos Finales** (5 ejercicios avanzados) - Proyecto completo

### Características del Proyecto
- Relaciones 1-1, 1-N y N-N
- Más de 30 jugadores, 6 clanes, 30 misiones
- Datos realistas de un juego RPG
- Ejercicios progresivos de dificultad
- Casos de uso del mundo real

**Tema**: Sistema de Juego RPG (Proyecto Integrador)

---

## 🚀 Cómo Usar Este Curso

### 1. Instalación de PostgreSQL
Sigue las instrucciones en `Dia 01/practica/01_instalacion_postgresql.sql`

### 2. Orden de Estudio Recomendado
Para cada día:
1. Lee la teoría correspondiente
2. Ejecuta los archivos de práctica en orden
3. Carga los datos de ejercicios: `ejercicios/insert_data.sql`
4. Intenta resolver los ejercicios por tu cuenta
5. Compara tus soluciones con las proporcionadas

### 3. Ejecutar los Scripts
```bash
# Conectar a PostgreSQL
psql -U postgres

# Ejecutar un archivo
\i ruta/al/archivo.sql

# O desde la terminal
psql -U postgres -f ruta/al/archivo.sql
```

### 4. Conexión con Python (Día 6)
```bash
# Instalar dependencias
pip install psycopg2

# Ejecutar el script
python "Dia 06/bbdd.py"
```

## 📊 Datos de Práctica

Cada día utiliza datos diferentes y temáticas variadas:
- **Día 1**: Biblioteca Municipal
- **Día 2**: Restaurante
- **Día 3**: Tienda de Videojuegos
- **Día 4**: Plataforma de Streaming de Música
- **Día 5**: Sistema de Reservas de Hotel
- **Día 6**: Sistema de E-commerce
- **Día 7**: Sistema de Juego RPG (Proyecto Final)

## 🎓 Requisitos Previos

- Conocimientos básicos de informática
- Ganas de aprender
- PostgreSQL instalado (se explica en el Día 1)

## 💡 Consejos para el Aprendizaje

1. **Practica cada día**: No avances sin dominar el contenido anterior
2. **Experimenta**: Modifica las consultas y observa los resultados
3. **Toma notas**: Documenta lo que aprendes
4. **Resuelve los ejercicios**: La práctica es fundamental
5. **Consulta las soluciones**: Pero solo después de intentarlo

## 🔧 Herramientas Recomendadas

- **psql**: Cliente de línea de comandos (incluido con PostgreSQL)
- **pgAdmin**: Interfaz gráfica para PostgreSQL
- **DBeaver**: Cliente universal de bases de datos
- **VS Code**: Con extensión PostgreSQL

## 📝 Estructura de Archivos

```
Curso-SQL-7-Dias/
├── README.md
├── Dia 01/
│   ├── practica/
│   │   ├── 01_instalacion_postgresql.sql
│   │   └── 02_exploracion_sistema.sql
│   └── ejercicios/
│       ├── ejercicio_01.sql
│       └── ejercicio_02.sql
├── Dia 02/
│   ├── practica/
│   │   ├── 01_create_drop_table.sql
│   │   ├── 02_insert_into.sql
│   │   └── ... (10 archivos)
│   └── ejercicios/
│       ├── insert_data.sql
│       ├── ejercicio_01.sql
│       ├── ejercicio_02.sql
│       ├── soluciones_ejercicio_01.sql
│       └── soluciones_ejercicio_02.sql
├── Dia 03/ ... Dia 06/
│   └── (misma estructura)
└── Dia 07/
    ├── 01.creacion_tablas.sql
    ├── insert_data/
    │   ├── 01.jugadores.sql
    │   ├── 02.clanes.sql
    │   └── ... (9 archivos)
    ├── proyecto_final_ejercicios.sql
    └── proyecto_final_soluciones.sql
```

## 🤝 Contribuciones

Este es un curso educativo. Si encuentras errores o tienes sugerencias, no dudes en contribuir.

## 📜 Licencia

Material educativo de libre uso para aprendizaje personal.

## ✨ Características del Curso

✅ Progresión gradual de dificultad  
✅ Ejemplos prácticos con datos reales  
✅ Ejercicios con soluciones detalladas  
✅ Datos variados para mantener el interés  
✅ Enfoque en PostgreSQL  
✅ Incluye conexión con Python  
✅ Optimización y buenas prácticas  

---

**¡Buena suerte en tu aprendizaje de SQL! 🚀**
