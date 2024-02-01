#!/bin/bash

# Preguntar al usuario si desea instalar OBS
read -p "¿Desea instalar OBS? (y/n): " respuesta

# Verificar la respuesta del usuario
if [ "$respuesta" == "y" ]; then
    # Instalar OBS
    sudo apt install obs > /dev/null 2>&1
    echo "OBS instalado correctamente."
else
    # Continuar con la ejecución del programa
    echo "Continuando con la ejecución del programa."
fi
