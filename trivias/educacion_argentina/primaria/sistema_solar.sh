#!/bin/bash

# Variables
score=0
questions=(
    "¿Cuál es el planeta más cercano al Sol?" 
    "¿Cuántos planetas hay en el sistema solar?" 
    "¿Qué planeta es conocido como el planeta rojo?" 
    "¿Cómo se llama el satélite natural de la Tierra?" 
    "¿Qué planeta tiene los anillos más grandes?" 
    "¿Qué estrella es el centro del sistema solar?" 
    "¿Qué planeta es el más grande del sistema solar?" 
    "¿Qué planeta es el más lejano del Sol?" 
    "¿En qué planeta están los volcanes más grandes del sistema solar?" 
    "¿Qué planeta es famoso por tener una gran mancha roja?"
)
options=(
    "Marte" "Venus" "Mercurio" 
    "7" "8" "9" 
    "Júpiter" "Marte" "Saturno" 
    "Estrella" "Sol" "Luna" 
    "Saturno" "Urano" "Neptuno" 
    "La Luna" "El Sol" "Marte" 
    "Júpiter" "Saturno" "Neptuno" 
    "Neptuno" "Urano" "Plutón" 
    "Venus" "Marte" "Tierra" 
    "Neptuno" "Saturno" "Júpiter"
)
answers=(3 2 2 3 1 2 1 1 2 3)  # Respuestas correctas: índice de la opción correcta

# Función para hacer una pregunta
hacer_pregunta() {
    echo "${questions[$1]}"
    echo "1) ${options[$(($1 * 3))]}  2) ${options[$(($1 * 3 + 1))]}  3) ${options[$(($1 * 3 + 2))]}"
    read -p "Tu respuesta (1, 2 o 3): " respuesta

    if [[ $respuesta -eq ${answers[$1]} ]]; then
        echo "¡Correcto!"
        ((score++))
    else
        respuesta_correcta="${options[$(($1 * 3 + ${answers[$1]} - 1))]}"
        echo "Incorrecto. La respuesta correcta era: $respuesta_correcta"
    fi
    echo
}

# Bienvenida
echo "¡Bienvenido a la trivia del sistema solar!"
echo "Responde a las siguientes preguntas seleccionando el número de la opción correcta."
echo

# Bucle de preguntas
for i in ${!questions[@]}; do
    hacer_pregunta $i
done

# Resultado final
echo "Has terminado la trivia."
echo "Tu puntuación final es: $score de ${#questions[@]}"

# Comentario final
if [[ $score -eq ${#questions[@]} ]]; then
    echo "¡Excelente trabajo, sabes mucho del sistema solar!"
elif [[ $score -ge $((${#questions[@]}/2)) ]]; then
    echo "¡Buen trabajo!"
else
    echo "¡Sigue aprendiendo sobre el espacio!"
fi

