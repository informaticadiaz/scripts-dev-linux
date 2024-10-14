#!/bin/bash

# Nombre del archivo donde se guardarán las respuestas
output_file="respuestas_usuario.txt"

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

# Crear o limpiar el archivo de salida
> "$output_file"

# Mostrar preguntas y recibir respuestas
for i in "${!questions[@]}"; do
  echo "Pregunta $((i+1)): ${questions[$i]}"
  echo "${options[$i]}"
  
  # Leer la respuesta del usuario
  read -p "Tu respuesta (puedes ingresar la letra o la respuesta completa): " user_answer
  
  # Guardar la respuesta del usuario en el archivo
  echo "Pregunta $((i+1)): Respuesta: $user_answer" >> "$output_file"
  
  # Obtener la letra de la respuesta correcta
  correct_answer_letter="${answers[$i]:0:1}"
  
  # Verificar si la respuesta del usuario es correcta
  if [ "$user_answer" == "$correct_answer_letter" ] || [ "$user_answer" == "${answers[$i]#* }" ]; then
    echo "Correcto!"
    score=$((score + 1))
  else
    echo "Incorrecto. La respuesta correcta es: ${answers[$i]}"
  fi
  echo
done

# Mostrar el puntaje final
echo "Has obtenido $score de ${#questions[@]} puntos."
if [ "$score" -ge $(( ${#questions[@]} / 2 )) ]; then
  echo "¡Aprobaste la evaluación!"
else
  echo "Desaprobaste la evaluación. ¡Sigue practicando!"
fi

# Mensaje final sobre el archivo generado
echo "Las respuestas han sido guardadas en el archivo: $output_file"

