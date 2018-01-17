#!/bin/bash

SERVICE="traefik"
IMAGE="$SERVICE-image"

OPTION=$(whiptail --title $SERVICE --menu "Choose your option" 15 60 4 \
"1" "Build $SERVICE" \
"2" "(Re)Start service $SERVICE" \
"3" "Stop service $SERVICE" 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $OPTION
else
    echo "You chose Cancel."
fi

case "$OPTION" in

1)  cd $IMAGE
    docker build -t $IMAGE .
    ;;
2)  cd traefik/log
    truncate -s 0 access.log
    truncate -s 0 traefik.log
    cd ../..
    docker-compose down
    docker-compose rm
    sleep 3
    docker-compose up -d 
    ;;
3)  docker-compose stop
    docker-compose rm
    ;;
esac
