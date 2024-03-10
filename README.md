#  Creación de entorno

En este apartado se consolida la información del entorno necesario donde se brindan la soluciones a diferentes de los problemas planteados

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

- Se crea el archivo llamado `Dockerfile` ubicado en el directorio docker
- Creación del `docker-compose.yml` ubicado en el directorio docker

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
