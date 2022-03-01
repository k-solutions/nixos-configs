#!/bin/bash

export SESSION=monitors 
function hasSession() {
  tmux has-session -t $SESSION 2>/dev/null
}

xmobar &

if hasSession ; then
  echo "Session already exists"
  tmux kill-session -t $SESSION
else
  # xmobar &
  tmux new-session -d -s $SESSION
  tmux split-window -h -p 40 journalctl -f
  tmux split-window -v watch acpi -V
  tmux select-pane -t 0 
  tmux send-keys 'htop -t' C-m 
  tmux attach-session -d -t $SESSION
fi

