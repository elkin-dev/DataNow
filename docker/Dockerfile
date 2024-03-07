# Usa la imagen oficial de PostgreSQL como base
FROM postgres:16.2

# Copiar un archivo de configuración personalizado
COPY postgresql.conf /etc/postgresql/postgresql.conf

# Exponer el puerto por defecto
EXPOSE 5432

# Iniciar PostgreSQL al ejecutar el contenedor
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]