FROM marcermarc/spigot:latest

# This is just a modification of marcermars spigot-container
# see https://hub.docker.com/r/marcermarc/spigot

LABEL Hans-Peter Weidinger <weidinger.hp@gmail.com>

COPY scripts/start.sh /opt/minecraft

# also expose the RCon ports
EXPOSE 25575:25575/tcp 25575:25575/udp

# use the start.sh instead of the startup-program so we can
# reliably set memory consumption
ENTRYPOINT [ "/opt/minecraft/start.sh" ]
