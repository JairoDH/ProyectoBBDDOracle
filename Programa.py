from Funciones import *

db = conectar_bbdd("localhost","jairo","1994","empresa")
opcion = menu()
print (opcion)
while opcion != 0 : 
    if opcion == 1 :
        mostrar_trabajadores(db)
    elif opcion == 2:
        informacion_telefono(db)
    elif opcion == 3:
        informacion_matricula(db)
    elif opcion == 4:
        nuevo_camion(db)
    elif opcion == 5:
        eliminar_camion(db)
    elif opcion == 6:
        actualizar_trabajador(db)
    else:
        print("Opción incorrecta.")
        opcion = menu()
desconectar_bbdd(db)