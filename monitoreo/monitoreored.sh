#!/bin/bash
# Monitorea el ancho de banda de la red

INTERFACE="wlan0" # Cambia esta variable según tu interfaz de red

echo "Monitorenado el uso de ancho de nbanda en la interfaz $INTERFACE..."
while true; do
	RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
	TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
	sleep 1
	RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
	TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

	RX_BPS=$((RX2 - RX1)) # Bytes por segundo recibidos
	TX_BPS=$((TX2 - TX1)) # Bytes por segundo enviados

	echo "Recibiendo $((RX_BPS / 1024)) KD/s - Enviando: $((TX_BPS / 1024 )) KB/s"
done
