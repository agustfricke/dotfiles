def encontrar_diferencias(archivo1, archivo2):
    with open(archivo1, 'r', encoding='iso-8859-1') as file1, open(archivo2, 'r', encoding='iso-8859-1') as file2:
        lineas_archivo1 = file1.readlines()
        lineas_archivo2 = file2.readlines()

    diferencias = []
    for i, (linea1, linea2) in enumerate(zip(lineas_archivo1, lineas_archivo2)):
        if linea1 != linea2:
            diferencias.append((i + 1, linea1, linea2))

    if len(lineas_archivo1) > len(lineas_archivo2):
        for i, linea in enumerate(lineas_archivo1[len(lineas_archivo2):], len(lineas_archivo2) + 1):
            diferencias.append((i, linea, ''))  
    elif len(lineas_archivo1) < len(lineas_archivo2):
        for i, linea in enumerate(lineas_archivo2[len(lineas_archivo1):], len(lineas_archivo1) + 1):
            diferencias.append((i, '', linea)) 

    return diferencias


archivo1 = 'app.txt'
archivo2 = 'app2.txt'

resultado = encontrar_diferencias(archivo1, archivo2)
if resultado:
    print(f"Se encontraron diferencias entre {archivo1} y {archivo2}:")
    for numero_linea, linea1, linea2 in resultado:
        print(f"Línea {numero_linea}:")
        print(f"- {archivo1}: {linea1.rstrip()}")
        print(f"- {archivo2}: {linea2.rstrip()}")
        print()
else:
    print("No se encontraron diferencias entre los archivos.")
