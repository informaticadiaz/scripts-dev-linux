#!/bin/bash
# Limpia los archivos temporales y la caché del sistema.

echo "Limpiando archivos temporales y caché..."

# Limpia la caché de paquetes
sudo apt-get clean

# Elimina archivos temporales
sudo rm -rf /tmp/*

# Limpia los archivos huérfanos de paquetes
sudo apt-get autoremove -y

echo "Limpieza completada."
