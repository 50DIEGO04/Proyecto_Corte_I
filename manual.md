
# Manual de Usuario - Proyecto Corte I  

## Introducción  
Este documento describe el conjunto de scripts automatizados en Bash creados para la monitorización de recursos, gestión de copias de seguridad y análisis de logs en Ubuntu 20.04. Además, se explican los procesos de instalación, ejecución y administración del proyecto con Git.  

---

## Requisitos Previos  
Antes de ejecutar los scripts, asegúrese de contar con los siguientes requisitos:  

1. Ubuntu 20.04  
2. Git instalado con el comando:  
   
 sudo apt install git
   
3. Tener permisos de sudo habilitados  

---

## Instalación  
Para utilizar el proyecto, siga estos pasos:  

1. Clonar el repositorio desde GitHub:  
   
   git clone https://github.com/50DIEGO04/Proyecto_Corte_I.git
   
   Este comando descarga el contenido del repositorio y crea una carpeta con el nombre del proyecto.  

2. Ingresar al directorio del proyecto:  
   
   cd Proyecto_Corte_I
  
   Este comando cambia el directorio de trabajo al del proyecto clonado.  

3. Dar permisos de ejecución a los scripts:  
   
   chmod +x scripts/*.sh
   
   Este comando permite que todos los archivos en la carpeta scripts puedan ejecutarse como programas.  

---

## Descripción de los Scripts  

### 1. Análisis de Logs (log_analysis.sh)  
Este script analiza los archivos de log del sistema en busca de errores, advertencias y eventos críticos.  

Uso:  

./scripts/log_analysis.sh

Código principal:  

LOG_FILE="/var/log/syslog"
OUTPUT_FILE="logs/analysis.log"
PATTERN="error|fail|warning|critical"

echo "Analizando logs en $LOG_FILE..."
echo "Resultados guardados en $OUTPUT_FILE"
echo "Fecha de Análisis: $(date)" > "$OUTPUT_FILE"

grep -Ei "$PATTERN" "$LOG_FILE" >> "$OUTPUT_FILE"
if [ $? -eq 0 ]; then
    echo "Análisis completado. Se encontraron coincidencias."
else
    echo "No se encontraron coincidencias en el log."
fi
```
Explicación línea por línea:  
1. Define la variable LOG_FILE con la ruta del archivo de logs del sistema.  
2. Define la variable OUTPUT_FILE con la ruta donde se guardarán los resultados.  
3. Define un patrón de búsqueda con palabras clave como error, fallo y advertencia.  
4. Imprime en pantalla que se está analizando el archivo de logs.  
5. Imprime en pantalla que los resultados se guardarán en el archivo de salida.  
6. Escribe la fecha del análisis en el archivo de salida.  
7. Usa grep para buscar en el archivo de logs las palabras clave y las guarda en el archivo de salida.  
8. Comprueba si grep encontró coincidencias y muestra un mensaje en pantalla.  

---

### 2. Gestión de Backups (backup_manager.sh)  
Este script realiza copias de seguridad automáticas del proyecto y las almacena en un directorio de respaldos.  

Uso:  

./scripts/backup_manager.sh

Código principal:  

BACKUP_DIR="backups"
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_FILE" Proyecto_Corte_I

echo "Backup creado exitosamente: $BACKUP_FILE"

Explicación línea por línea:  
1. Define la variable BACKUP_DIR con la ruta del directorio donde se guardarán los respaldos.  
2. Define el nombre del archivo de respaldo con la fecha y la hora en el nombre.  
3. Crea el directorio de respaldos si no existe.  
4. Comprime el contenido del directorio del proyecto y lo guarda en el archivo de respaldo.  
5. Imprime un mensaje indicando que el respaldo fue creado exitosamente.  

---

### 3. Monitoreo de Recursos (resource_monitor.sh)  
Este script monitorea el uso de CPU, memoria y espacio en disco, mostrando un resumen en tiempo real.  

Uso:  

./scripts/resource_monitor.sh

Código principal:  

echo "Monitoreo de recursos:"
echo "Uso de CPU:"
top -b -n1 | grep "Cpu(s)"
echo "Uso de Memoria:"
free -h
echo "Espacio en Disco:"
df -h

Explicación línea por línea:  
1. Imprime en pantalla el título del monitoreo de recursos.  
2. Imprime en pantalla la etiqueta "Uso de CPU".  
3. Usa el comando top para obtener el estado de la CPU y lo filtra con grep para mostrar solo la línea de uso de CPU.  
4. Imprime en pantalla la etiqueta "Uso de Memoria".  
5. Usa el comando free -h para mostrar el uso de memoria en formato legible.  
6. Imprime en pantalla la etiqueta "Espacio en Disco".  
7. Usa el comando df -h para mostrar el espacio disponible en disco en formato legible.  

---

## Automatización con cron  
Para ejecutar los scripts automáticamente, se han configurado tareas en cron.  

Editar tareas programadas:  

crontab -e

Ejemplo de configuración:  

*/5 * * * * /home/juan/Proyecto_Corte_I/scripts/resource_monitor.sh
0 23 * * * /home/juan/Proyecto_Corte_I/scripts/backup_manager.sh
0 * * * * /home/juan/Proyecto_Corte_I/scripts/log_analysis.sh

Explicación línea por línea:  
1. Ejecuta el monitoreo de recursos cada 5 minutos.  
2. Genera un backup todos los días a las 23:00.  
3. Analiza logs cada hora.  

---

## Gestión de Ramas en Git  
Para una mejor organización, cada funcionalidad se gestiona en una rama independiente en Git.  

1. Crear una nueva rama para desarrollo:  
   
   git checkout -b nueva_funcionalidad
   
2. Subir cambios a la rama en GitHub:  
   
   git add .
   git commit -m "Añadiendo nueva funcionalidad"
   git push origin nueva_funcionalidad
   
3. Fusionar la nueva funcionalidad en main:  
   
   git checkout main
   git merge nueva_funcionalidad
   git push origin main
   
4. Eliminar la rama después de la fusión:  
   
   git branch -d nueva_funcionalidad
   

---

## Conclusiones  
Se implementaron scripts automatizados en Bash para monitoreo, backups y análisis de logs.  

Se utilizaron ramas en Git para una mejor organización del desarrollo.  

Se configuró cron para ejecutar los scripts automáticamente sin intervención manual.  

El proyecto es fácilmente escalable y se puede adaptar a diferentes entornos.  

La documentación permite que cualquier usuario pueda instalar y ejecutar los scripts sin dificultades.  

El uso de GitHub facilita el control de versiones y la colaboración en equipo.  

---

#Historial de commits 

*   5e2ca34 (backup_manager) Merge branch 'main' into backup_manager
|\  
* | bff3c5b (origin/backup_manager) Añadiendo script de gestion de backups
| | *   115d36c (resource_monitor) Merge branch 'main' into resource_monitor
| | |\  
| | |/  
| |/|   
| * | 7a9b5c0 (HEAD -> main, origin/log_analyzer, origin/cron_jobs, log_analyzer, cron_jobs) Añadiendo script de analisis de logs
| * | 7335ac7 Agregando carpetas logs y backup
|/ /  
| * 96f473c (origin/resource_monitor) Añadiendo script de monitoreo de recursos
|/  
* 92e2c43 (origin/main) Primer commit - Inicializando el respositorio
* 5077823 Primer commit - Inicializando repositorio

