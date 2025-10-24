-------------------------------------------------
--Requisitos previos
-------------------------------------------------
Docker Desktop o Docker Engine (versión 24 o superior)
Docker Compose (ya viene incluido en Docker Desktop)
Acceso a Internet (solo la primera vez, para descargar imágenes)

-------------------------------------------------
--Instalacion de conetenedores
-------------------------------------------------
Abrir una consola de Power Shell (Con permisos de administrador)

1 - Ir a la ruta donde se alojan los archivos (Modificar si es otra)
cd C:\RetoDesarrolladorX\VContenedor

2 - Construir e iniciar los contenedores
docker compose up -d --build

3 - Verificar que los contenedores están corriendo
docker ps

4 - Rutas y datos de acceso
Frontend Angular: http://localhost:4200

Backend API: http://localhost:8000/docs

Base de datos MySQL:
Host: localhost
Port: 3307
Database: TelcoX_BSS
User: root
Password: Admin*123

5 - Datos de prueba
0912345678	NESTOR DANIEL RODRIGUEZ MOLINA
0998765432	CARLOS FABIAN GOMEZ LOPEZ

6 - Detener los contenedores (Opcional)
docker compose down

7 - Limpiar imágenes y volúmenes (opcional)
docker system prune -a
docker volume prune
