FROM alpine:latest

# This is just a modification of marcermars spigot-container
# see https://hub.docker.com/r/marcermarc/spigot

LABEL maintainer "Hans-Peter Weidinger <weidinger.hp@gmail.com>"

# -------------------------------------
# Define version, heap and extra params
# -------------------------------------
ARG VERSION=latest

# ------------------------------
# Compile Spigot with BuildTools
# Compile Start.java
# Add user minecraft
# ------------------------------
RUN mkdir /opt/minecraft /mnt/minecraft \
  && apk add --no-cache openjdk8-jre-base \
  && adduser -D minecraft \
  && chown -R minecraft /mnt/minecraft \
  && chmod -R 777 /mnt/minecraft 

# ------------
# Expose ports
# ------------
EXPOSE 25565:25565/tcp 25565:25565/udp

# also expose the rcon ports
EXPOSE 25575:25575/tcp 25575:25575/udp

# -------------
# Define volume
# -------------
VOLUME ["/mnt/minecraft"]

# ----------------
# Set startup user
# ----------------
USER minecraft

# ----------------
# Add start script
# ----------------
COPY scripts/start.sh /opt/minecraft

# -----------------------------
# copy jar from prev build-step
# -----------------------------
COPY spigot.jar /opt/minecraft/spigot.jar

# ----------------
# default heap size
# ----------------
ENV HEAP=2G 


ENTRYPOINT [ "/bin/sh", "/opt/minecraft/start.sh" ]