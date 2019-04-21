#!/bin/bash

read -p "Container/tmux session name: " sessionname

sed -i "s/CONNAME/$sessionname/" docker-compose.yml run.sh interact.sh service.service

sed -i "s/DIRPATH/$(pwd)/"

mv service.service $sessionname.service

read -e -p "Link container service? [y/n]: " choice
[[ "$choice" == [Yy]* ]] && sudo ln -s $sessionname.service
echo 
