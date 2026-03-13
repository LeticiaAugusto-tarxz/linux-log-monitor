#!/bin/bash

# =================================================================
# NOME: Limes-Log-Watchdog.sh
# DESCRIÇÃO: Monitora tentativas de falha de login SSH em tempo real.
# AUTOR: Letícia Augusto
# =================================================================

LOG_FILE="/var/log/auth.log" # Para Debian/Ubuntu (No Arch use journalctl)
ALERT_LOG="/tmp/ssh_alerts.log"

echo "[*] Iniciando monitoramento de segurança SSH..."

# Comando que monitora o arquivo de log continuamente
tail -Fn0 $LOG_FILE | while read LINE; do
   if echo "$LINE" | grep -q "Failed password"; then
      IP=$(echo "$LINE" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -1)
      echo "[ALERTA] Tentativa de invasão detectada do IP: $IP em $(date)" >> $ALERT_LOG
      echo -e "\e[31m[!] ALERTA: Tentativa de força bruta detectada do IP: $IP\e[0m"
   fi
done
