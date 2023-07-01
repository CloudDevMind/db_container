# Utiliza una imagen base oficial de PostgreSQL con la versión específica que deseas
FROM postgres:15.3-alpine

# Copia un archivo de inicialización personalizado a la imagen
COPY ./scripts/01-init.sql /docker-entrypoint-initdb.d/

# Inicia el servidor PostgreSQL
CMD ["postgres"]
