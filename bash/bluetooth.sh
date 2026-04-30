#!/run/current-system/sw/bin/bash
headphones="45:2F:56:A0:8B:14" 

device() {
echo "info 45:2F:56:A0:8B:14" | bluetoothctl | grep -m 1 Connected: > /dev/null
}

bluetooth() {
echo "connect $headphones" | bluetoothctl 
echo "trust $headphones" | bluetoothctl
}

bluetooth_connect() {
until device; do
bluetooth
done
}

bluetooth_connect
