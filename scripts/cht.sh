#!/usr/bin/env bash

languages=$(echo "golang c haskell typescript cpp lua" | tr " " "\n")
core_utils=$(echo "find grep tmux awk sed xargs" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "query: " query

if echo "$languages" | grep -qs $selected; then
  tmux split-window -p 40 -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -R"
else
  tmux split-window -p 40 -h bash -c "curl cht.sh/$selected~$query | less -R"
fi
