#!/bin/bash

directorio_principal="www"

texto_a_buscar="t3-purple-1000"
nuevo_texto="gris-1000"

find "$directorio_principal" -type f -exec sed -i "s/$texto_a_buscar/$nuevo_texto/g" {} +
