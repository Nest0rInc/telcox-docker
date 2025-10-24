# Imagen base oficial de Python
FROM python:3.11-slim

# Crea y usa la carpeta de trabajo
WORKDIR /app

# Copia solo el archivo de requerimientos primero (para cachear dependencias)
COPY app/requirements.txt .

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Instala FastAPI CLI y Uvicorn (por si no están en requirements.txt)
RUN pip install fastapi uvicorn

# Copia el resto del código de la app
COPY app/ /app/

# Expone el puerto donde correrá la API
EXPOSE 8000

# Comando para ejecutar tu servidor FastAPI (modo desarrollo)
CMD ["fastapi", "dev", "main.py", "--host", "0.0.0.0", "--port", "8000"]
