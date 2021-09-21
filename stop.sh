#!/bin/bash
SESSION=$USER

#pkill -SIGINT roslaunch
tmux kill-session -t $SESSION
tmux kill-session -a
