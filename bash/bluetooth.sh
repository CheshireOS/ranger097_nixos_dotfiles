#!/usr/bin/env bash
headphones="45:2F:56:A0:8B:14" 

device() {
echo "info 45:2F:56:A0:8B:14" | bluetoothctl | grep -m 1 Connected: > /dev/null
}

bluetooth_on() {
echo "pairable on" | bluetoothctl
echo "scan on" | bluetoothctl
}

bluetooth() {
echo "pair $headphones" | bluetoothctl 
echo "connect $headphones" | bluetoothctl 
}

bluetooth_connect() {
bluetooth_on
sleep 10
until device; do
bluetooth
sleep 10
done
}

bluetooth_connect
