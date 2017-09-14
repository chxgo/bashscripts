#!/bin/bash
# Script para asignar dinámicamente valor a variable

echo -n "Por favor escriba su nombre y apellido: "
read nombre apellido
echo "Hola \"$nombre\", ¿Cómo se encuentra la familia \"$apellido\"?"