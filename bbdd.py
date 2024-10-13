import psycopg2

# Configuración de conexión
hostname = 'localhost'  # o la dirección IP de tu servidor
database = 'postgres'    # nombre de la base de datos por defecto
username = 'postgres'  # tu nombre de usuario
password = ''  # tu contraseña
port = '5432'            # puerto por defecto de PostgreSQL

# Conectar a la base de datos
try:
    connection = psycopg2.connect(
        host=hostname,
        database=database,
        user=username,
        password=password,
        port=port
    )

    print("Conexión exitosa a la base de datos.")
    
    # Crear un cursor para realizar operaciones
    cursor = connection.cursor()
    
    # Ejemplo: Obtener la versión de PostgreSQL
    cursor.execute("SELECT version();")
    db_version = cursor.fetchone()
    print("Versión de PostgreSQL:", db_version)

    # Insertar un nuevo cliente en la tabla 'clientes'
    cursor.execute("select * from clientes")
    clientes = cursor.fetchall()
    print(clientes)
    connection.commit()  # Confirmar los cambios
    
    
    # Cerrar la conexión y el cursor
    if cursor:
        cursor.close()
    if connection:
        connection.close()
        print("Conexión cerrada.")

except Exception as error:
    print("Error inesperado al conectar a la base de datos.")
    print("Detalles del error:", error)  