#!/bin/bash
if [ "$EUID" -ne 0 ]
  then sudo $0
  exit
fi

sessionname=mac350

chmod +x *.sh

tmux has-session -t $sessionname
if [ $? != 0 ]; then
    #split-window -b ./watchfolder.sh \; select-pane -L \; attach
    tmux new -s $sessionname -d "docker-compose up ; echo \"Docker stoped! (press any key to continue)\" ; read" \; \
    split-window -b "./interact.sh" \; \
    attach
else
    tmux attach -t $sessionname
fi
 
