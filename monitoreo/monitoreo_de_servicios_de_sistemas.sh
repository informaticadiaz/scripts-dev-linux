#!/bin/bash
# Monitorea el estado de servicios específicos

SERVICIOS=("nginx" "mysql" "docker")  # Lista de servicios a monitorear

echo "Monitoreando servicios..."

for servicio in "${SERVICIOS[@]}"
do
  systemctl is-active --quiet $servicio
  if [ $? -eq 0 ]; then
    echo "$servicio está corriendo."
  else
    echo "Alerta: $servicio no está corriendo."
  fi
done

