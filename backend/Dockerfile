# Dockerfile para el backend
FROM node:16

# Establece el directorio de trabajo
WORKDIR /app

# Copia el package.json y package-lock.json (si existe)
COPY backend/package*.json ./

# Instala las dependencias (esto instalará express, pg, body-parser y otras)
RUN npm install

# Copia los archivos del backend al contenedor
COPY backend/ .

# Expone el puerto donde el backend estará corriendo (3000 en este caso)
EXPOSE 3000

# Comando para iniciar el servidor
CMD ["npm", "start"]
