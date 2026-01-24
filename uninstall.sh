#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

stow -t "$XDG_CONFIG_HOME" -D .
