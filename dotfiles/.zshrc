#!/bin/bash
# Override usual commands (make them verbose).
alias cp="cp -v"
alias cpl="rsync -av --stats --progress"
alias mv="mv -v"
alias rm="rm -v"

# Alias for filesystem shortcuts.
alias ..="cd .."
alias c="clear"
alias d="du -sh"
alias l="ls -CF"
alias la="ls -a"
alias ll="ls -alF"

# Alias for Homebrew.
alias brewdeps="brew deps --tree --installed"
alias brewpackages="brew leaves"

# Alias for MacOS.
alias dsfiles="find . -name '.DS_Store' -type f -delete"

# Alias for my own customization.
alias projects="cd ~/Projects"

# Alias for Git.
alias ga="git add"
alias gb="git branch"
alias gc="git commit -m"
alias gcot="git checkout"
alias gl="git log"
alias gpull="git pull"
alias gpush="git push -u origin"
alias gs="git status"
