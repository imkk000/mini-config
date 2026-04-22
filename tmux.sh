#!/usr/bin/env bash
SAVE="${2:-session.txt}"

case "$1" in
s)
  # save layout + panes
  tmux display-message -p '#{window_layout}' >"$SAVE.layout"
  tmux list-panes -F '#{pane_index}|#{pane_width}|#{pane_height}|#{pane_current_path}|' \
    >>"$SAVE"
  echo "Saved. Edit $SAVE to add commands."
  ;;
r)
  [ ! -f "$SAVE" ] && echo "No save file: $SAVE" && exit 1

  count=$(wc -l <"$SAVE")
  # create all panes first
  for ((i = 1; i < count; i++)); do
    tmux split-window
    tmux select-layout tiled
  done
  # apply saved layout
  tmux select-layout "$(cat $SAVE.layout)"

  # send commands
  while IFS='|' read -r idx w h path cmd; do
    tmux send-keys -t ".$idx" "cd $path" Enter
    tmux send-keys -t ".$idx" "$cmd" Enter
  done <"$SAVE"
  ;;
*)
  echo "Usage: $0 s|r"
  ;;
esac
