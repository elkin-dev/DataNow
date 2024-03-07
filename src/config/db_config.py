from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError

engine_str = "postgresql+psycopg2://postgres:datanow2024@127.0.0.1:5438/postgres"
engine = create_engine(engine_str)


# # Intentar establecer la conexión
# try:
#     engine = create_engine(engine_str)
#     with engine.connect() as connection:
#         print("¡Conexión exitosa!")

# except OperationalError as e:
#     print("Error de conexión:", e)
