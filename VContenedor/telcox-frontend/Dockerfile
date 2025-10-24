# Etapa 1: Compilar Angular
FROM node:20 AS build

WORKDIR /app

# Copiamos los archivos de configuración primero
COPY package*.json ./

# Instalamos dependencias (bootstrap, etc.)
RUN npm install

# Copiamos el resto del código fuente
COPY . .

# Compilamos la aplicación Angular para producción
RUN npm run build -- --configuration=production

# Etapa 2: Servir con Nginx
FROM nginx:1.25-alpine

# Eliminamos el contenido por defecto de Nginx y copiamos nuestro build
RUN rm -rf /usr/share/nginx/html/*
# Copiamos el build real (Angular 17+ usa la carpeta "browser")
COPY --from=build /app/dist/telcox-frontend/browser /usr/share/nginx/html
# Damos permisos de lectura
RUN chmod -R 755 /usr/share/nginx/html

# Exponemos el puerto 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
