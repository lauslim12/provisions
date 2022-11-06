#!/bin/bash

##
# aliases.sh
#
# This script is used to provide my custom aliases to a terminal.
# Aliases are sorted alphabetically for ease of reading. It is agnostic and compatible
# with my configurations, whether it is MacOS or Linux.
##

###############################################################################
# Initial setup, run needed functions before performing alias operations.     #
###############################################################################

# Ensure that our directory is colored properly (blue in MacOS). If true then GNU's `ls`, else macOS's `ls`.
if ls --color > /dev/null 2>&1; then
	COLORFLAG="--color"
else
	COLORFLAG="-G"
	export LSCOLORS='Cxfxcxdxbxegedabagacad'
fi

# Ensure MacOS devices can get special aliases.
if [[ "$OSTYPE" == darwin* ]]; then
	alias lock="pmset displaysleepnow"
fi

###############################################################################
# Alias for existing commands, make more verbose, shorter, or change them.    #
###############################################################################

alias c="clear"
alias cat="bat"
alias cp="cp -v"
alias cpl="rsync -av --stats --progress"
alias mkdir="mkdir -p"
alias mv="mv -v"
alias rm="rm -v"

###############################################################################
# Alias for navigation                                                        #
###############################################################################

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

###############################################################################
# Alias for directory listing                                                 #
###############################################################################

alias l="ls -CF ${COLORFLAG}"
alias la="ls -a ${COLORFLAG}"
alias ld="ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep "^l""
alias ll="ls -alF ${COLORFLAG}"
alias ls="ls ${COLORFLAG}"

###############################################################################
# Alias for Docker                                                            #
###############################################################################

alias dockeraccess="docker exec -it"
alias dockercleanvolume='docker volume rm $(docker volume ls -q)'
alias dockerfree="docker system df"
alias dockerimages="docker images"
alias dockerprune="docker system prune -a"
alias dockerps="docker ps"
alias dockerstatus='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"'

###############################################################################
# Alias for Docker Compose                                                    #
###############################################################################

alias ddown="docker compose down"
alias dup="docker compose up -d"

###############################################################################
# Alias for Homebrew                                                          #
###############################################################################

alias brewdeps="brew deps --tree --installed"
alias brewpackages="brew leaves"

###############################################################################
# Alias for personal use, files/folders, and configurations.                  #
###############################################################################

# Lists all files and folders with their human readable size in descending order.
alias duls="du -sh .* * | sort -hr"

# Preview all files in the current tree, colored with 'bat' and optimized with 'fzf'.
alias preview="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Prints all of the environment variables in the current Shell.
alias path='echo -e ${PATH//:/\\n}'

# Reloads current Shell.
alias reload="exec ${SHELL} -l"

###############################################################################
# Alias for Git                                                               #
###############################################################################

alias ga="git add"
alias gb="git branch"
alias gc="git commit -m"
alias gcancel="git reset HEAD~1"
alias gcot="git checkout"
alias gf="git fetch"
alias gfza="git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 git add"
alias ggone="git fetch --all --prune && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D"
alias gl="git log"
alias glog="git log --oneline | fzf --preview 'git show --name-only {1}'"
alias gm="git merge"
alias gpull="git pull"
alias gpush="git push -u origin"
alias grestore="git restore --staged ."
alias gru="git remote update --prune"
alias gs="git status"

###############################################################################
# Alias for Python                                                            #
###############################################################################

# Cleans 'py[cod]' and '__pychache__' directories/files in the current tree.
alias pythonclean='find . | grep -E "(__pycache__|\.py[cod]$)" | xargs rm -rf -v'

###############################################################################
# Alias for Node                                                              #
###############################################################################

# Cleans `node_modules` folder recursively from the current working directory. Also prints out the folders being deleted.
alias nodeclean='find . -name "node_modules" -type d -prune -exec rm -rf -v '{}' \;'

###############################################################################
# Alias for MacOS operating system                                            #
###############################################################################

# Cleans '.DS_Store' in the current tree.
alias dsfiles='find . -name ".DS_Store" -type f -print -delete'
