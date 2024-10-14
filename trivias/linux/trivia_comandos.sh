#!/bin/bash

# Preguntas y respuestas
preguntas=("¿Cuál es el comando para listar los archivos en un directorio?
" "¿Cuál es la extensión de los scripts de Bash?
" "¿Cuál es el comando para crear un directorio?")
respuestas=("ls" "sh" "mkdir")

# Variable para llevar el puntaje
puntaje=0

# Función para mostrar una pregunta
mostrar_pregunta() {
    echo "${preguntas[$1]}"
    read respuesta_usuario
}

# Función para verificar la respuesta
verificar_respuesta() {
    if [[ "${respuesta_usuario}" == "${respuestas[$1]}" ]]; then
        echo "¡Correcto!"
        ((puntaje++))
    else
        echo "Incorrecto. La respuesta correcta era: ${respuestas[$1]}"
    fi
}

# Bucle para hacer las preguntas
for ((i=0; i<${#preguntas[@]}; i++)); do
    mostrar_pregunta $i
    verificar_respuesta $i
done

# Mostrar el puntaje final
echo "Tu puntaje final es: $puntaje de ${#preguntas[@]}"
