#!/run/current-system/sw/bin/bash
/run/current-system/systemd/bin/systemctl is-active --quiet tor
if [ $? -eq 0 ]; then
    echo "ENCRYPTED"
else
    echo "UNENCRYPTED"
fi


