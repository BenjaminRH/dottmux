#!/usr/bin/env bash

PANE_ID=$1
PANE_PID=$2

CMDLINE=`python <<EOF
import psutil
cur_proc = psutil.Process(pid=$PANE_PID)
cur_proc_children = cur_proc.children()
p = cur_proc_children[0] if cur_proc_children else cur_proc
args = p.cmdline()
for i, arg in enumerate(args):
    if ' ' in arg:
        args[i] = '"' + arg + '"'
print(' '.join(args))
EOF`

tmux select-pane -t $PANE_ID -T "$CMDLINE"
