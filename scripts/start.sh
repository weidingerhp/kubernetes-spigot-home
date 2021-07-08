#!/bin/sh

if [ "${HEAP}" == "" ]
  then export HEAP=3G
fi

echo Starting minecraft server with heap: HEAP ${HEAP}

cd /mnt/minecraft
java -Xmx${HEAP} -Xms${HEAP} -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=50 -XX:+AlwaysPreTouch -XX:+UseLargePagesInMetaspace -Dcom.mojang.eula.agree=true -Dfile.encoding=UTF-8 -jar /opt/minecraft/spigot.jar nogui