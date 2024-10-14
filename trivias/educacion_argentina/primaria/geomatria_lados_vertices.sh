#!/bin/bash

# Variables
score=0

# Funciones para dibujar figuras
dibujar_cuadrado() {
    echo "  +---+  "
    echo "  |   |  "
    echo "  +---+  "
}

dibujar_rectangulo() {
    echo "  +-------+  "
    echo "  |       |  "
    echo "  +-------+  "
}

dibujar_triangulo() {
    echo "     /\\     "
    echo "    /  \\    "
    echo "   /____\\   "
}

dibujar_circulo() {
    echo "    .-\"\"\"-.   "
    echo "  .'       '. "
    echo " /           \\"
    echo "|             |"
    echo " \\           /"
    echo "  '.       .' "
    echo "    '-...-'   "
}

# Función para hacer una pregunta
hacer_pregunta() {
    echo "$1"
    read -p "Tu respuesta: " respuesta

    if [[ "$respuesta" -eq "$2" ]]; then
        echo "¡Correcto!"
        ((score++))
    else
        echo "Incorrecto. La respuesta correcta era: $2"
    fi
    echo
}

# Bienvenida
echo "¡Bienvenido al ejercicio de geometría!"
echo "Responde a las siguientes preguntas sobre figuras geométricas."
echo

# Preguntas y dibujo de figuras
dibujar_cuadrado
hacer_pregunta "¿Cuántos lados tiene un cuadrado?" 4
hacer_pregunta "¿Cuántos vértices tiene un cuadrado?" 4

dibujar_rectangulo
hacer_pregunta "¿Cuántos lados tiene un rectángulo?" 4
hacer_pregunta "¿Cuántos vértices tiene un rectángulo?" 4

dibujar_circulo
hacer_pregunta "¿Cuántos lados tiene un círculo?" 0
hacer_pregunta "¿Cuántos vértices tiene un círculo?" 0

dibujar_triangulo
hacer_pregunta "¿Cuántos lados tiene un triángulo?" 3
hacer_pregunta "¿Cuántos vértices tiene un triángulo?" 3

# Resultado final
echo "Has terminado el ejercicio."
echo "Tu puntuación final es: $score de 8"

# Comentario final
if [[ $score -eq 8 ]]; then
    echo "¡Excelente trabajo, conoces muy bien la geometría!"
elif [[ $score -ge 4 ]]; then
    echo "¡Buen trabajo!"
else
    echo "¡Sigue aprendiendo sobre figuras geométricas!"
fi

