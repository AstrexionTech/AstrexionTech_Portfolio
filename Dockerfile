# Usamos una imagen ligera y oficial de Node
FROM node:20-alpine

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos SOLO los archivos de configuración de paquetes primero.
# Esto aprovecha el caché de Docker y evita descargas innecesarias si tu package.json no ha cambiado.
COPY package*.json ./

# Instalamos las dependencias
RUN npm install

# Copiamos el resto del código del proyecto
COPY . .

# Exponemos el puerto por defecto de Astro
EXPOSE 4321

# Comando para iniciar en modo desarrollo.
# El '-- --host' es OBLIGATORIO en Docker para que Astro exponga el puerto al exterior.
CMD ["npm", "run", "dev", "--", "--host"]