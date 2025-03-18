#!/bin/bash
# Script para monitorear el uso de CPU, RAM, Disco y Red

LOG_FILE="logs/system_stats.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] - Monitoreo de Recursos del Sistema" >> $LOG_FILE
echo "=============================================" >> $LOG_FILE

# Uso de CPU
echo "CPU Usage:" >> $LOG_FILE
top -b -n1 | grep "Cpu(s)" | awk '{print "  Uso: " $2 + $4 "%"}' >> $LOG_FILE

# Uso de RAM
echo "RAM Usage:" >> $LOG_FILE
free -h | awk '/Mem/ {print "  Total: "$2", Usado: "$3", Libre: "$4}' >> $LOG_FILE

# Uso de Disco
echo "Disk Usage:" >> $LOG_FILE
df -h / | awk '/\// {print "  Total: "$2", Usado: "$3", Disponible: "$4}' >> $LOG_FILE

# Uso de Red (Cambiado de eth0 a eno1)
echo "Network Usage:" >> $LOG_FILE
ifconfig eno1 | grep "RX packets" >> $LOG_FILE
ifconfig eno1 | grep "TX packets" >> $LOG_FILE

echo "" >> $LOG_FILE

