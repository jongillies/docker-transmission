#!/bin/bash
DEFAULT_USERNAME='transmission'
USERNAME=${USERNAME:-$DEFAULT_USERNAME}
DEFAULT_PASSWORD='password'
PASSWORD=${PASSWORD:-$DEFAULT_PASSWORD}

mkdir -p /config

if [ ! -f /config/settings.json ]; then
    mv /var/lib/transmission-daemon/info/settings.json /config/settings.json
    #chown -R daemon:daemon /downloads /incomplete /watch /config /usr/local/share/transmission
    #su - daemon -c "/usr/local/bin/transmission-daemon --foreground --config-dir /config --log-info"
else
    rm /var/lib/transmission-daemon/info/settings.json
fi

ln -sf /config/settings.json /var/lib/transmission-daemon/info/settings.json

/usr/local/bin/transmission-daemon --foreground --config-dir /config --log-info --username ${USERNAME} \
    --peerport 45555 \
    --password ${PASSWORD} --auth --watch-dir /watch --download-dir /downloads --incomplete-dir /incomplete
