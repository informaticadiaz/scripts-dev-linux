#!/bin/bash

# Variables
score=0
questions=(
    "¿Cuál es la capital de Buenos Aires?" 
    "¿Cuál es la capital de Córdoba?" 
    "¿Cuál es la capital de Santa Fe?" 
    "¿Cuál es la capital de Mendoza?" 
    "¿Cuál es la capital de Tucumán?" 
    "¿Cuál es la capital de Salta?" 
    "¿Cuál es la capital de Misiones?" 
    "¿Cuál es la capital de Entre Ríos?" 
    "¿Cuál es la capital de Chaco?" 
    "¿Cuál es la capital de La Pampa?"
)
options=(
    "1) La Plata  2) Buenos Aires  3) Mar del Plata" 
    "1) Río Cuarto  2) Villa María  3) Córdoba" 
    "1) Rosario  2) Santa Fe  3) Rafaela" 
    "1) Mendoza  2) San Rafael  3) Las Heras" 
    "1) San Miguel de Tucumán  2) Tafí Viejo  3) Yerba Buena" 
    "1) Tartagal  2) Salta  3) Orán" 
    "1) Posadas  2) Oberá  3) Eldorado" 
    "1) Paraná  2) Concordia  3) Gualeguaychú" 
    "1) Resistencia  2) Sáenz Peña  3) Villa Ángela" 
    "1) General Pico  2) Santa Rosa  3) Toay"
)
answers=(1 3 2 1 1 2 1 1 1 2)  # Respuestas correctas: índice de la opción correcta

# Función para hacer una pregunta
hacer_pregunta() {
    echo "${questions[$1]}"
    echo "${options[$1]}"
    read -p "Tu respuesta (1, 2 o 3): " respuesta

    if [[ $respuesta -eq ${answers[$1]} ]]; then
        echo "¡Correcto!"
        ((score++))
    else
        respuesta_correcta="${options[$1]:3:${#options[$1]}}"
        respuesta_correcta=$(echo "$respuesta_correcta" | cut -d ' ' -f $(((${answers[$1]} - 1) * 2 + 2)))
        echo "Incorrecto. La respuesta correcta era: $respuesta_correcta"
    fi
    echo
}

# Bienvenida
echo "¡Bienvenido a la trivia de provincias argentinas y sus capitales!"
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
    echo "¡Excelente trabajo, conoces muy bien las provincias de Argentina!"
elif [[ $score -ge $((${#questions[@]}/2)) ]]; then
    echo "¡Buen trabajo!"
else
    echo "¡Sigue aprendiendo sobre las provincias argentinas!"
fi

