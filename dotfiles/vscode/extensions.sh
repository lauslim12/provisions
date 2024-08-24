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

code --install-extension astro-build.astro-vscode
code --install-extension biomejs.biome
code --install-extension bradlc.vscode-tailwindcss
code --install-extension charliermarsh.ruff
code --install-extension davidanson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension golang.go
code --install-extension ms-python.debugpy
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension naumovs.color-highlight
code --install-extension pkief.material-icon-theme
code --install-extension stivo.tailwind-fold
code --install-extension wayou.vscode-todo-highlight
