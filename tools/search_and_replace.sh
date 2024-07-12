#!/bin/bash

directorio_principal="/"

texto_a_buscar=""
nuevo_texto=""

find "$directorio_principal" -type f -exec sed -i "s/$texto_a_buscar/$nuevo_texto/g" {} +
