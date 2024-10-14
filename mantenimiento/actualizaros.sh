#!/bin/bash
# Actualiza el sistema automáticamente

echo "Actualizando la lista de paquetes..."
sudo apt-get update

echo "Instalando actualizaciones..."
sudo apt-get upgrade -y

echo "Limpiando paquetes obsoletos..."
sudo apt-get autoremove -y

echo "Sistema actualizado."

