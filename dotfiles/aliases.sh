#!/bin/bash

##
# aliases.sh
#
# This script is used to provide my custom aliases to a terminal.
# Aliases are sorted alphabetically for ease of reading. It is agnostic and compatible
# with my configurations, whether it is MacOS or Linux.
##

# Initial setup, run needed functions before performing alias operations.
# Ensure that our directory is colored properly (blue in MacOS). If true then GNU's `ls`, else macOS's `ls`.
if ls --color > /dev/null 2>&1; then
	COLORFLAG="--color"
else
	COLORFLAG="-G"
fi

# Alias for existing commands, make them more verbose, or make them shorter.
alias c="clear"
alias d="du -sh"
alias cp="cp -v"
alias cpl="rsync -av --stats --progress"
alias mkdir="mkdir -p"
alias mv="mv -v"
alias rm="rm -v"

# Alias for navigation.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Alias for directory listing.
alias l="ls -CF ${COLORFLAG}"
alias la="ls -a ${COLORFLAG}"
alias ld="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep "^l""
alias ll="ls -alF ${COLORFLAG}"
alias ls="ls ${COLORFLAG}"

# Alias for Docker.
alias dockeraccess="docker exec -it"
alias dockercleanvolume='docker volume rm $(docker volume ls -q)'
alias dockerfree="docker system df"
alias dockerimages="docker images"
alias dockerprune="docker system prune -a"
alias dockerps="docker ps"
alias dockerstatus='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'

# Alias for Docker Compose.
alias ddown="docker compose down"
alias dup="docker compose up -d"

# Alias for Homebrew.
alias brewdeps="brew deps --tree --installed"
alias brewpackages="brew leaves"

# Alias for MacOS.
alias dsfiles="find . -name '.DS_Store' -type f -delete"

# Alias for my own personal stuff, such as files/folders and configurations.
alias reload="exec ${SHELL} -l"
alias projects="cd ~/Projects"

# Alias for Git.
alias ga="git add"
alias gb="git branch"
alias gc="git commit -m"
alias gcot="git checkout"
alias gf="git fetch"
alias gm="git merge"
alias gpull="git pull"
alias gpush="git push -u origin"
alias gru="git remote update --prune"
alias gs="git status"
