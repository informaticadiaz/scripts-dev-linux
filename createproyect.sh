#!/bin/bash

# Solicitar al usuario el nombre de la aplicación
echo "Por favor, ingresa el nombre de la aplicación:"
read nombre_app

# Crear una nueva aplicación Vite con el template de React y TypeScript
pnpm create vite $nombre_app --template react-ts

# Cambiar al directorio de la aplicación
cd $nombre_app

# Instalar tailwindcss, postcss y autoprefixer como dependencias de desarrollo
pnpm install -D tailwindcss postcss autoprefixer

# Inicializar tailwindcss
npx tailwindcss init -p

# Instalar Prettier como dependencia de desarrollo
pnpm add --save-dev --save-exact prettier

# Crear el archivo .prettierignore con las reglas específicas
echo "node_modules" > .prettierignore
echo "build" >> .prettierignore
echo "coverage" >> .prettierignore

# Mensaje de finalización
echo "Proyecto '$nombre_app' creado exitosamente."
