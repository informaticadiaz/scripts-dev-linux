#!/bin/bash

declare -A preguntas

# Preguntas sobre navegación
preguntas["¿Cómo cambiar de directorio?"]="cd"
preguntas["¿Cómo listar archivos en un directorio?"]="ls"
preguntas["¿Cómo ver el contenido de un archivo?"]="cat"

# Preguntas sobre gestión de archivos
preguntas["¿Cómo copiar un archivo?"]="cp"
preguntas["¿Cómo mover un archivo?"]="mv"
preguntas["¿Cómo eliminar un archivo?"]="rm"

# Preguntas sobre permisos
preguntas["¿Cómo cambiar permisos de un archivo?"]="chmod"
preguntas["¿Cómo cambiar propietario de un archivo?"]="chown"

# Función para hacer preguntas
function hacer_preguntas {
    for pregunta in "${!preguntas[@]}"; do
        echo "$pregunta"
        read -p "Tu respuesta: " respuesta
        if [[ "$respuesta" == "${preguntas[$pregunta]}" ]]; then
            echo "¡Correcto!"
        else
            echo "Incorrecto. La respuesta correcta es: ${preguntas[$pregunta]}"
        fi
        echo ""
    done
}

# Ejecutar el script
hacer_preguntas

