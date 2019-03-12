#!/bin/bash
CONTAINER_NAME=mac350_db_1
echo Waiting for container $CONTAINER_NAME...
until [[ $(docker inspect -f {{.State.Running}} $CONTAINER_NAME) == "true" ]]; do
    sleep 0.3;
done;
clear
docker exec -it $CONTAINER_NAME sudo -u postgres /bin/bash