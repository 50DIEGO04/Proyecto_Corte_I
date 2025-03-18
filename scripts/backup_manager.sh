#!/bin/bash
# Script para realizar copias de seguridad de una carpeta específica

SOURCE_DIR="$HOME/Proyecto_Corte_I/scripts"
BACKUP_DIR="$HOME/Proyecto_Corte_I/backups"

TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")  # Formato de fecha y hora
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Crear el directorio de backups si no existe
mkdir -p $BACKUP_DIR

# Crear el archivo comprimido
tar -czf $BACKUP_FILE $SOURCE_DIR

# Verificar si el backup fue exitoso
if [ $? -eq 0 ]; then
    echo "Backup creado exitosamente: $BACKUP_FILE"
else
    echo "Error al crear el backup"
    exit 1
fi
