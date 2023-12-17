#!/usr/bin/env bash

languages=$(echo "golang c haskell typescript cpp lua" | tr " " "\n")
core_utils=$(echo "xrandr find grep tmux awk sed xargs" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "query: " query

if echo "$languages" | grep -qs $selected; then
  query=`echo $query | tr ' ' '+'`
  curl -s cht.sh/$selected/$query | less -R
else
  curl -s cht.sh/$selected~$query | less -R
fi
