#!/bin/bash
# Elimina archivos temporales

echo "Eliminando archivos temporales del sistema..."

sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "Archivos temporales eliminados."
