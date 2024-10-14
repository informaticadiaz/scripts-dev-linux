#!/bin/bash
# Realiza un respaldo de un directorio

DIRECTORIO="/home/ignacio/scripting" # Cambia la ruta del directorio
RESPALDO="/home/ignacio/scripting/backup_$(date +%Y%m%d_5H%M%S).tar.gz"

echo "realizando respaldo de $DIRECTORIO en $RESPALDO..."

tar -czf $RESPALDO $DIRECTORIO

echo "Repaldo completado."
