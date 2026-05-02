#!/run/current-system/sw/bin/bash
headphones="45:2F:56:A0:8B:14" 

device() {
echo "info 45:2F:56:A0:8B:14" | bluetoothctl | grep -m 1 Connected: > /dev/null
}

bluetooth() {
echo "pairable on $headphones" | bluetoothctl
echo "scan on $headphones" | bluetoothctl 
echo "pair $headphones" | bluetoothctl 
echo "connect $headphones" | bluetoothctl 
echo "trust $headphones" | bluetoothctl
sleep 10
}

bluetooth_connect() {
until device; do
bluetooth
done
}

bluetooth_connect
