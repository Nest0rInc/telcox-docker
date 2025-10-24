from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
import mysql.connector

app = FastAPI(title="API TelcoX BSS", version="1.0")

# Permisos de acceso
app.add_middleware(
    CORSMiddleware,
    #allow_origins=["*"], # Para pruebas se dejara abierto para cualquier origen
    allow_origins=[
        "http://localhost:4200", 
        "http://127.0.0.1:4200" 
    ], # Si se desea ser especifico con los origenes
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Configuracion de conexión a MySQL
db_config = {
    #"host": "localhost",
    "host": "mysql",
    "user": "root",
    "password": "Admin*123",
    "database": "TelcoX_BSS"
}

# Modelo de respuesta
class ClienteConsumo(BaseModel):
    nombre_completo: str
    saldo: float
    consumo_datos: float
    consumo_minutos: float

# Endpoint principal
@app.get("/api/cliente/{identificacion}", response_model=ClienteConsumo)
def obtener_consumo_cliente(identificacion: str):
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = """
        SELECT 
            c.nombre_completo,
            co.saldo,
            co.consumo_datos,
            co.consumo_minutos
        FROM clientes c
        JOIN contratos ct ON c.id = ct.cliente_id
        JOIN contrato_planes cp ON ct.id = cp.contrato_id
        JOIN consumos co ON cp.id = co.contrato_plan_id
        WHERE c.identificacion = %s AND c.es_activo = TRUE
        ORDER BY co.fecha DESC
        LIMIT 1;
        """

        cursor.execute(query, (identificacion,))
        result = cursor.fetchone()

        if not result:
            raise HTTPException(status_code=404, detail="Cliente no encontrado o sin consumo registrado")

        return ClienteConsumo(**result)

    except mysql.connector.Error as err:
        raise HTTPException(status_code=500, detail=f"Error en base de datos: {err}")

    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()