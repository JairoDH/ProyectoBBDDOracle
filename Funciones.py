import cx_Oracle
import sys

#conectarse
def conectar_bbdd(user,password,host, port, database):
    try:
        dsn_tns = cx_Oracle.makedsn(user, port, database)
        db = cx_Oracle.connect(host,user,password,database)
        return db
    except cx_Oracle.Error as e:
        print("No se pudo conectar a la base de datos",e)
        sys.exit(1)
def desconectar_bbdd(db):
    db.close()

def menu():
    print("Menu: ")
    print("1. Mostrar trabajadores. ")
    print("2. Consultar trabajador por su teléfono. ")
    print("3. Mostrar trabajadores asociados por matrícula. ")
    print("4. Introducir camión nuevo a la empresa: ")
    print("5. Eliminar camión.")
    print("6. Actualización de los datos del trabajador.")
    opcion = int(input("Selecciona una opcion: "))
    return opcion


#consultanumero1
def mostrar_trabajadores(db):
       
    sql = "select c.nombre, c.apellido1, c.provincia, ca.matricula from CAMION_CONDUCTOR cc JOIN CONDUCTOR c ON cc.codigo_conductor = c.codigo JOIN CAMION ca ON cc.matricula_camion = ca.matricula"
    cursor = db.cursor()
    try:
        cursor.execute(sql)
        registros = cursor.fetchall()
        for registro in registros:
            print(registro[0],registro[1],registro[2],registro[3])
        return registros
    except:
        print("Error en la consulta.")
  


#consultanumero2

def informacion_codigo(db):
    
    codigo = int(input("Introduzca el código del trabajador: "))

    sql = "SELECT * FROM CONDUCTOR WHERE codigo = %s"
    cursor = db.cursor()

    try:     
        cursor.execute(sql, (codigo,))
        registro = cursor.fetchone()
        while registro:
            print(registro[0],registro[1],registro[2],registro[3],registro[4],registro[5],registro[6],registro[7],registro[8],registro[9])
            registro = cursor.fetchone()

    except:
        print("Error en la consulta")
    db.close()


#consultanumero3

def informacion_matricula(db):

    matricula_camion = input("Introduzca la matrícula del camión: ")

    sql = "SELECT * FROM CAMION_CONDUCTOR cc JOIN CONDUCTOR c ON cc.codigo_conductor = c.codigo JOIN CAMION ca ON cc.matricula_camion = ca.matricula WHERE ca.matricula = %s"
    cursor = db.cursor()

    try:
        cursor.execute(sql, (matricula_camion,))
        registros = cursor.fetchall()
        for registro in registros:
            print(registro[0],registro[1],registro[2],registro[3],registro[4],registro[5],registro[6],registro[7],registro[8],registro[9])
        return registros
    except:
        print("Error en la consulta")


#consultanumero4

def nuevo_camion(db):

    matri = input("Introduce la matrícula (0000AAA): ")
    fecha = input("Introduce la fecha de alta (YYYY-MM-DD): ")
    peso = int(input("Introduce el peso máximo a transportar: "))

    sql = "INSERT INTO CAMION (matricula, fecha_alta, peso_maximo) VALUES ('{matri}', '{fecha}', '{peso}')"
    cursor = db.cursor()

    try:
        cursor.execute(sql.format(matri=matri, fecha=fecha, peso=peso))
        db.commit()
    except:
        db.rollback()
    db.close()

#consultanumero5

def eliminar_camion(db):

    dni = input("Introduce el DNI: ")


    sql = "SELECT matricula_camion FROM CAMION_CONDUCTOR WHERE codigo_conductor = ( SELECT codigo FROM CONDUCTOR where DNI = %s)"
    cursor = db.cursor()

    try:
        cursor.execute(sql, (dni))
        resultado = cursor.fetchone()
        if resultado is not None:
            matricula_camion = resultado[0]
            borrar = "DELETE FROM CAMION_CONDUCTOR WHERE matricula_camion = %s"
            borrar2 = "DELETE FROM CAMION WHERE matricula  = %s"
            cursor.execute(borrar, (matricula_camion))
            cursor.execute(borrar2, (matricula_camion))
            db.commit()
            print("Camión eliminado correctamente.")
    except MySQLdb.Error as e:
        print(e)
        sys.exit(1)
    

#consultanumero6

def actualizar_trabajador(db):

    nombre = input("Dime el nombre del conductor: ")
    apellido1 = input("Dime el primer apellido del conductor: ")

    nuevo_telefono = input("Introduce el número de teléfono: ")
    nuevo_municipio = input("Introduce el nuevo municipio: ")


    sql = "UPDATE CONDUCTOR SET telefono = %s, poblacion = %s WHERE nombre = %s AND apellido1 = %s"
    cursor = db.cursor()

    try:
        cursor.execute(sql, (nuevo_telefono, nuevo_municipio, nombre, apellido1))
        if cursor.rowcount == 0:
            print("No se ha encontrado conductor con ese nombre.",nombre, apellido1)
        else:
            db.commit()
            print("Se ha actualizado correctamente el conductor.", nombre, apellido1)
    except:
        db.rollback()
        print("No se ha podido actualizar el conductor.")
    db.close()
