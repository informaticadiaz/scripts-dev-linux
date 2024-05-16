#!/bin/bash

# Verificar si las herramientas necesarias están instaladas
command -v pnpm >/dev/null 2>&1 || { echo >&2 "pnpm no está instalado. Por favor, instálalo antes de continuar."; exit 1; }
command -v npx >/dev/null 2>&1 || { echo >&2 "npx no está instalado. Por favor, instálalo antes de continuar."; exit 1; }
command -v cat >/dev/null 2>&1 || { echo >&2 "cat no está instalado. Por favor, instálalo antes de continuar."; exit 1; }

# Solicitar al usuario el nombre de la aplicación
echo "Por favor, ingresa el nombre de la aplicación:"
read nombre_app

# Verificar si el directorio de la aplicación ya existe
if [ -d "$nombre_app" ]; then
    echo "¡El directorio '$nombre_app' ya existe! Por favor, elige otro nombre."
    exit 1
fi

# Crear una nueva aplicación Vite con el template de React y TypeScript
pnpm create vite $nombre_app --template react-ts || { echo >&2 "Error al crear la aplicación Vite. Por favor, verifica tu conexión a internet e inténtalo de nuevo."; exit 1; }

# Cambiar al directorio de la aplicación
cd $nombre_app || { echo >&2 "Error al cambiar al directorio de la aplicación."; exit 1; }

# Instalar tailwindcss, postcss y autoprefixer como dependencias de desarrollo
pnpm install -D tailwindcss postcss autoprefixer || { echo >&2 "Error al instalar tailwindcss, postcss y autoprefixer."; exit 1; }

# Inicializar tailwindcss
npx tailwindcss init -p || { echo >&2 "Error al inicializar tailwindcss."; exit 1; }

# Instalar Prettier como dependencia de desarrollo
pnpm add --save-dev --save-exact prettier || { echo >&2 "Error al instalar Prettier."; exit 1; }


# Crear el archivo .prettierignore con las reglas específicas
echo "node_modules" > .prettierignore
echo "build" >> .prettierignore
echo "coverage" >> .prettierignore

# Crear el archivo .prettierrc
# Y escribir reglas .prettierrc
cat << EOF > .prettierrc
{
  "trailingComma": "es5",
  "tabWidth": 2,
  "semi": true,
  "singleQuote": true,
  "plugins": [
    "prettier-plugin-tailwindcss"
  ],
  // Puedes agregar más configuraciones aquí
}
EOF

# Eliminar el archivo index.css dentro de la carpeta src
rm src/index.css

# Sobrescribir el contenido del archivo src/App.css
echo "@tailwind base;" > src/App.css
echo "@tailwind components;" >> src/App.css
echo "@tailwind utilities;" >> src/App.css

# Mensaje de finalización
echo "Proyecto '$nombre_app' creado exitosamente."
