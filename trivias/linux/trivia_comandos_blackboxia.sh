#!/bin/bash

# Preguntas y respuestas
questions=(
  "¿Qué comando se utiliza para listar los archivos y directorios en Linux?
  a) cd
  b) ls
  c) mkdir
  d) rm
  "
  "¿Qué comando se utiliza para crear un directorio en Linux?
  a) mkdir
  b) rm
  c) cd
  d) ls
  "
  "¿Qué comando se utiliza para eliminar un archivo en Linux?
  a) cd
  b) mkdir
  c) rm
  d) ls
  "
  "¿Qué comando se utiliza para cambiar los permisos de un archivo?
  a) touch
  b) chown
  c) mkdir
  d) chmod
  "
  "¿Cuál de los siguientes comandos muestra el espacio disponible en el sistema de archivos?
  a) du
  b) df
  c) ps
  d) top
  "
  "¿Qué comando muestra el contenido de un archivo en la terminal?
  a) nano
  b) cat
  c) rm
  d) mkdir
  "
  "¿Qué comando se utiliza para cambiar de directorio en Linux?
  a) pwd
  b) ls
  c) cd
  d) cp
  "
  "¿Cuál es el comando correcto para copiar un archivo en Linux?
  a) mv
  b) rm
  c) cp
  d) touch
  "
  "¿Qué comando permite ver los preocesos en ejecucíon en el sistema?
  a) ls
  b) ps
  c) chmod
  d) mkdir
  "
  "¿Qué comano muestra la ruta actual en la que te encuentras?
  a) pwd
  b) cd
  c) ls
  d) rm
  "
  "
  "

  # Agrega más preguntas aquí
)

answers=(
  "b"
  "a"
  "c"
  "d"
  "b"
  "b"
  "c"
  "c"
  "b"
  "a"
  # Agrega más respuestas aquí
)

# Función para corregir las respuestas
correct_answer() {
  local question=$1
  local answer=$2
  local user_answer=$3

  if [ "$user_answer" = "$answer" ]; then
    echo "¡Correcto! La respuesta es $answer"
  else
    echo "Lo siento, la respuesta correcta es $answer"
  fi
}

# Preguntas y corrección
for i in "${!questions[@]}"; do
  echo "${questions[$i]}"
  read -p "Respuesta: " user_answer
  correct_answer "${questions[$i]}" "${answers[$i]}" "$user_answer"
done
