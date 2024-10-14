#!/bin/bash
# Monitorea el espacio en disco y alerta si se supera el 90% de uso

THRESHOLD=90 # Porcentaje de uso máximo permitido

echo "Monitoreando el uso del disco..."

df -H | awk '{ if($5+0 > '$THRESHOLD') print "Alerta: El volumen "$1" está al "$5" de su capacidad."; }'
