#!/bin/bash
# Script para analizar logs y buscar patrones específicos

LOG_FILE="/var/log/syslog"  # Archivo de log a analizar (puedes cambiarlo)
OUTPUT_FILE="logs/analysis.log"
PATTERN="error|fail|warning|critical"  # Palabras clave a buscar

echo "Analizando logs en $LOG_FILE..."
echo "Resultados guardados en $OUTPUT_FILE"
echo "Fecha de Análisis: $(date)" > $OUTPUT_FILE
echo "--------------------------------------" >> $OUTPUT_FILE

# Buscar patrones en el archivo de log y guardarlos en el archivo de salida
grep -Ei "$PATTERN" $LOG_FILE >> $OUTPUT_FILE

# Verificar si se encontraron coincidencias
if [ $? -eq 0 ]; then
    echo "Análisis completado. Se encontraron coincidencias."
else
    echo "No se encontraron coincidencias en el log."
fi
