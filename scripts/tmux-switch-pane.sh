#!/usr/bin/env bash

# Configure
#LIST_DATA="#{window_name} [#{pane_index}]>#{pane_current_path} | #{pane_title}"
LIST_DATA="#{window_name} [#{pane_index}] @ #{pane_current_path}"
FZF_COMMAND="fzf-tmux -p -- --delimiter=: --with-nth 4 --color=hl:2"
#FZF_COMMAND="fzf-tmux -- --delimiter=: --with-nth 4 --color=hl:2"

# Do not change
TARGET_SPEC="#{session_name}:#{window_id}:#{pane_id}:"

# Select a pane
LINE=$(tmux list-panes -a -F "$TARGET_SPEC $LIST_DATA" | $FZF_COMMAND) || exit 0
# Split the result
args=(${LINE//:/ })
# Activate the session/window/pane
tmux select-pane -t ${args[2]} && tmux select-window -t ${args[1]} && tmux switch-client -t ${args[0]}
