#!/bin/bash
if [ "$EUID" -ne 0 ]
  then sudo $0 $@
  exit
fi

sessionname=CONNAME

chmod +x *.sh

tmux has-session -t $sessionname
if [ $? != 0 ]; then
    #split-window -b ./watchfolder.sh \; select-pane -L \; attach
    rm -rf logpipe
    mkfifo logpipe

    attach="attach"
    catcmd=""
    # if its in daemon mode
    tty -s
    if [[ $? -eq 1 ]]; then
        catcmd="cat logpipe"
        attach=""
    else
        exec &>/dev/null
        cat logpipe &
    fi
    tmux new -s $sessionname \
        -d "docker-compose up --build | tee logpipe;\
            read -t5 -n1 -r -p 'Docker stoped! (press any key to hold)' key ;\
            if [ \"\$?\" -eq \"0\" ] ; then \
                read -n1000 -r -p 'Holding...' key ;\
            fi \
        " \; \
    split-window -b "./interact.sh" \; \
    $attach 
    eval $catcmd
else
    
    # if its in daemon mode
    tty -s
    if [[ $? -eq 1 ]]; then
        docker stop $CONNAME
        sleep 6
        $0 $@
    else
        tmux attach -t $sessionname
    fi
    
fi
 
