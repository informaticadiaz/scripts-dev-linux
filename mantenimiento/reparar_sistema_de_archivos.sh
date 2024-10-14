#!/bin/bash
# Verifica y repara el sistema de archivos

PARTICION="/dev/sda1"  # Cambia esto por la partición que quieras verificar

echo "Verificando el sistema de archivos en $PARTICION..."

sudo fsck -y $PARTICION

echo "Verificación y reparación completada."

