#!/bin/bash
# shellcheck disable=SC2207

# Doesn't let you press Ctrl-C
function ctrl_c() {
	echo -e "\renter nil to drop to normal prompt"
}

trap ctrl_c SIGINT

session_ids="$(tmux list-sessions)"
create_new_session="Create new session"
start_without_tmux="Start without tmux"
choices="${create_new_session}\n${start_without_tmux}"
if [ -n "$session_ids" ]; then
  choices="$choices\n$session_ids"
fi
choice=$(echo -e "$choices" | fzf | cut -d: -f1)
if [ "$choice" = "${create_new_session}" ]; then
  echo -n "Write session name: "
  read session
  exec tmux new-session -t $session
elif [ "$choice" = "${start_without_tmux}" ]; then
  zsh
else
  # Attach existing session
  tmux attach-session -t "$choice"
fi
exit 0
