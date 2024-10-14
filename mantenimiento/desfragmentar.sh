#!/bin/bash
# Desfragmenta el sistema de archivos ext4

DIRECTORIO="/ruta/al/directorio"  # Cambia esta ruta por el directorio a desfragmentar

echo "Iniciando desfragmentación de $DIRECTORIO..."

sudo e4defrag $DIRECTORIO

echo "Desfragmentación completada."

