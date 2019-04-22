#!/bin/bash
CONTAINER_NAME=CONNAME_db
echo Waiting for container $CONTAINER_NAME...
until [[ $(docker inspect -f {{.State.Running}} $CONTAINER_NAME) == "true" ]]; do
    sleep 0.5;
done;
clear
docker exec -it $CONTAINER_NAME /bin/sh -c "/bin/bash || /bin/sh"
