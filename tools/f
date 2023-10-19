#!/bin/bash

# Directorio base
personal_dir=~/personal
work_dir=~/work

# Utiliza find para listar todos los directorios en ~/personal
directories=$( (find "$personal_dir" -mindepth 1 -maxdepth 1 -type d && find "$work_dir" -mindepth 1 -maxdepth 1 -type d) | fzf)

# Verifica si se seleccionó un directorio
if [ -n "$directories" ]; then
    # Inicia una sesión de Tmux en el directorio seleccionado
    tmux new-session -c "$directories"
else
    echo "Ningún directorio seleccionado."
fi
