#!/bin/bash

dnf install \
  ctags \
  wmctrl \
  the_silver_searcher \
  autojump-zsh \
  direnv \
  jq

# Don't run ctags on HOME
touch ~/.notags
