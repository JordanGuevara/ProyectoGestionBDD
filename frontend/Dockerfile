# Dockerfile para el frontend
FROM node:16

# Establece el directorio de trabajo
WORKDIR /app

# Copia el package.json y package-lock.json (si existe)
COPY frontend/package*.json ./

# Instala las dependencias
RUN npm install

# Copia los archivos del frontend al contenedor
COPY frontend/ .

# Expone el puerto en el que live-server servirá la aplicación
EXPOSE 8080

# Comando para iniciar live-server
CMD ["npm", "start"]
