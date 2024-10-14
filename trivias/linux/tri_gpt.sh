#!/bin/bash

# Array de preguntas
questions=(
  "¿Qué operador en Bash se utiliza para comparar si dos números son iguales?"
  "¿Cómo se declara una variable en un script Bash?"
  "¿Cuál de los siguientes comandos es correcto para hacer un script ejecutable?"
  "¿Qué comando se utiliza para ejecutar un script Bash llamado myscript.sh en la terminal?"
  "¿Cuál es la estructura correcta de una sentencia if en Bash?"
)

# Array de opciones (cada conjunto corresponde a una pregunta)
options=(
  "a) ==  b) =  c) -eq  d) ==="
  "a) let VAR=5  b) var=5  c) VAR=5  d) int VAR=5"
  "a) chmod 644 script.sh  b) chmod +x script.sh  c) chmod 777 script.sh  d) chmod -r script.sh"
  "a) run myscript.sh  b) bash ./myscript.sh  c) sh run myscript.sh  d) ./myscript.sh"
  "a) if [ condición ]; then ... fi  b) if ( condición ) { ... } end  c) if ( condición ) then ... done  d) if [ condición ] then ... end"
)

# Respuestas correctas con la opción completa
answers=(
  "c) -eq"
  "c) VAR=5"
  "b) chmod +x script.sh"
  "d) ./myscript.sh"
  "a) if [ condición ]; then ... fi"
)

# Inicializar puntaje
score=0

# Mostrar preguntas y recibir respuestas
for i in "${!questions[@]}"; do
  echo "$((i+1)) ${questions[$i]}"
  echo "${options[$i]}"
  
  # Leer la respuesta del usuario
  read -p "Respuesta: " user_answer
  
  # Obtener la letia correcta de la respuesta
  correct_answer_letter="${answers[$i]:0:1}"
  
  # Comparar la respuesta del usuario con la correcta
  if [ "$user_answer" == "$correct_answer_letter" ]; then
    echo "Correcto!"
    score=$((score + 1))
  else
    echo "Incorrecto. La respuesta correcta es: ${answers[$i]}"
  fi
  echo
done

# Mostrar el puntaje final
echo "Has obtenido $score de ${#questions[@]} puntos."
if [ "$score" -eq "${#questions[@]}" ]; then
  echo "¡Excelente! ¡Tienes un conocimiento sólido de Bash!"
elif [ "$score" -ge $(( ${#questions[@]} / 2 )) ]; then
  echo "Buen trabajo, pero podrías mejorar en algunos conceptos."
else
  echo "Es un buen momento para repasar los conceptos de Bash."
fi

