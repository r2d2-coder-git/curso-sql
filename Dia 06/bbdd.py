# =====================================================
# DÍA 6: CONEXIÓN A BBDD CON PYTHON
# Tema: Sistema de E-commerce
# =====================================================

import psycopg2
from psycopg2 import Error

# Configuración de conexión
hostname = 'localhost'
database = 'ecommerce'
username = 'postgres'
password = 'tu_contraseña'
port = '5432'

def conectar_bd():
    """Establece conexión con la base de datos"""
    try:
        connection = psycopg2.connect(
            host=hostname,
            database=database,
            user=username,
            password=password,
            port=port
        )
        print("✓ Conexión exitosa a la base de datos")
        return connection
    except Error as e:
        print(f"✗ Error al conectar: {e}")
        return None

def consultar_productos(connection):
    """Consulta todos los productos"""
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM productos_tienda ORDER BY precio DESC;")
        productos = cursor.fetchall()
        
        print("\n--- LISTA DE PRODUCTOS ---")
        for producto in productos:
            print(f"ID: {producto[0]}, Nombre: {producto[1]}, Precio: €{producto[3]}")
        
        cursor.close()
    except Error as e:
        print(f"Error en consulta: {e}")

def insertar_producto(connection, nombre, categoria, precio, stock):
    """Inserta un nuevo producto"""
    try:
        cursor = connection.cursor()
        query = """
            INSERT INTO productos_tienda (nombre, categoria, precio, stock)
            VALUES (%s, %s, %s, %s) RETURNING id_producto;
        """
        cursor.execute(query, (nombre, categoria, precio, stock))
        id_producto = cursor.fetchone()[0]
        connection.commit()
        print(f"✓ Producto insertado con ID: {id_producto}")
        cursor.close()
    except Error as e:
        print(f"Error al insertar: {e}")
        connection.rollback()

def actualizar_stock(connection, id_producto, nuevo_stock):
    """Actualiza el stock de un producto"""
    try:
        cursor = connection.cursor()
        query = "UPDATE productos_tienda SET stock = %s WHERE id_producto = %s;"
        cursor.execute(query, (nuevo_stock, id_producto))
        connection.commit()
        print(f"✓ Stock actualizado para producto ID {id_producto}")
        cursor.close()
    except Error as e:
        print(f"Error al actualizar: {e}")
        connection.rollback()

def productos_bajo_stock(connection, limite=50):
    """Consulta productos con stock bajo"""
    try:
        cursor = connection.cursor()
        query = "SELECT nombre, stock FROM productos_tienda WHERE stock < %s;"
        cursor.execute(query, (limite,))
        productos = cursor.fetchall()
        
        print(f"\n--- PRODUCTOS CON STOCK BAJO (< {limite}) ---")
        for producto in productos:
            print(f"Producto: {producto[0]}, Stock: {producto[1]}")
        
        cursor.close()
    except Error as e:
        print(f"Error en consulta: {e}")

# Programa principal
if __name__ == "__main__":
    # Conectar a la base de datos
    conn = conectar_bd()
    
    if conn:
        # Realizar operaciones
        consultar_productos(conn)
        
        # Insertar nuevo producto
        insertar_producto(conn, 'Auriculares Bluetooth', 'Accesorios', 45.99, 75)
        
        # Actualizar stock
        actualizar_stock(conn, 1, 30)
        
        # Consultar productos con stock bajo
        productos_bajo_stock(conn, 50)
        
        # Cerrar conexión
        conn.close()
        print("\n✓ Conexión cerrada")  