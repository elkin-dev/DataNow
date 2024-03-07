## 1. CARGA DE INFORMACIÓN

En este apartado se consolida la información de como se implementa la solución del problema planteado en el punto **1**

## Requisitos

- Python 3.12
- requirements.txt

### 2. Pasos

#### 2.1. Creación del Entorno Virtual

Aquí se crea un entorno virtual utilizando `Python` `venv`.

```bash
python3 -m venv .venv
source .venv/bin/activate
```

#### 2.2. Instalación de Bibliotecas Utilizadas

El proyecto requiere la instalación de ciertas bibliotecas Python.
Puedes instalar los paquetes requeridos utilizando pip:

```bash
pip install -r requirements.txt
```

#### 2.3. Creación contenedor docker

- Se crea el archivo llamado `Dockerfile`

  ```yml
  # Usa la imagen oficial de PostgreSQL como base
  FROM postgres:16.2

  # Copiar un archivo de configuración personalizado
  COPY postgresql.conf /etc/postgresql/postgresql.conf

  # Exponer el puerto por defecto
  EXPOSE 5432

  # Iniciar PostgreSQL al ejecutar el contenedor
  CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]

  ```

- Creación del `docker-compose.yml`

  ```yml
  version: "3.9"

  services:
  DB-DataNow:
    image: postgres:16.2
    restart: always
    ports:
      - "127.0.0.1:5438:5432"
    shm_size: 128mb
    volumes:
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
      - postgres-data:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: "datanow2024"

  adminer:
    image: adminer
    restart: always
    ports:
      - "127.0.0.1:9090:8080"

  volumes:
  postgres-data:
  ```

- Ejecutar el contenedor

  ```bash
    docker-compose up
  ```

- Validar que esta corriendo el contenedor
  ```bash
  docker ps
  ```
- Desmontar el contenedor
  ```bash
  docker-compose down
  ```
