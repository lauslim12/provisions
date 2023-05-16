#!/bin/bash

##
# extensions.sh
#
# Installs all of my VSCode's extensions.
#
# Several useful commands:
# - To list and echo all extensions: code --list-extensions | xargs -L 1 echo code --install-extension
# - To uninstall all extensions: code --list-extensions | xargs -L 1 code --uninstall-extension
# - To install all extensions: bash ./vscode/extensions.sh (make sure that you're in `provisions` folder).
##

code --install-extension akamud.vscode-theme-onedark
code --install-extension akamud.vscode-theme-onelight
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension GitHub.github-vscode-theme
code --install-extension golang.go
code --install-extension Hyzeta.vscode-theme-github-light
code --install-extension loilo.snazzy-light
code --install-extension ms-python.black-formatter
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension naumovs.color-highlight
code --install-extension PKief.material-icon-theme
code --install-extension sdras.night-owl
code --install-extension teabyii.ayu
code --install-extension wayou.vscode-todo-highlight
code --install-extension zhuangtongfa.material-theme
