#!/bin/bash

read -p "Container/tmux session name: " sessionname

sed -i "s/CONNAME/$sessionname/" docker-compose.yml run.sh interact.sh service.service

sed -i "s@DIRPATH@$(pwd)@" service.service

mv service.service $sessionname.service

read -e -p "Link container service into systemd? [y/n]: " choice
[[ "$choice" == [Yy]* ]] && sudo ln -s "$(pwd)/$sessionname.service" /etc/systemd/system/$sessionname.service && sudo systemctl daemon-reload

echo Done! Dont forget to modify your docker-compose file!
