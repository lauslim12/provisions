# Provisions

This repository is a personal note to me if I ever get a new device in order to make the shifting process as swift as possible. When you got a new laptop / PC, remember to do the following.

## Windows

First, we are going to configure accounts before doing anything.

- Log in to Microsoft Account and link it to the device.
- Install [Google Chrome](https://www.google.com/chrome/).
- Refer to 'Manual Configurations' about Google Chrome.

Then, we are going to install applications needed.

- Install essential applications, refer to Google Drive for the list of essential applications for Windows.
- Install [Genshin Impact](https://genshin.mihoyo.com/) and login to it.
- Install [VirtualBox Virtual Machine](https://www.virtualbox.org/wiki/Downloads) with [elementaryOS](https://elementary.io/) (if applicable).

## Linux / MacOS

If I'm on Mac.

- `xcode-select --install`

First, install Homebrew as a package manager.

- Open your Terminal.
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Configure Homebrew to always use the latest version, use often.

- `brew update`
- `brew doctor`

First off, we're going to install all of the CLI tools that I will most definitely require.

- `brew install git`
- `brew install node && brew install yarn`
- `brew install python3 && brew install pipenv`

Then, we're going to install GUI applications.

- `brew install --cask google-chrome`
- `brew install --cask visual-studio-code`
- `brew install --cask zoom`

Ensure to always update Homebrew packages.

- `brew outdated`
- `brew upgrade`
- `brew update`

If I ever wanted to export my Homebrew.

- `cd ~`
- `brew bundle dump` will produce `Brewfile`.
- `brew bundle` to install from `Brewfile`.

We're done. Refer to 'Manual Configurations' for further steps.

## Manual Configurations

Configure Google Chrome:

- Log in to all of Google Accounts.
- Setup Google Synchronization (Contacts, Drive, and more).

Configure Git:

- `git config --global user.email 'my_email'`
- `git config --global user.name 'my_github_username'`
- Create an access token to be used with GitHub with a certain level of access control.
- Don't forget to use the access token when using `git push`.

Configure Visual Studio Code:

- Log in to Microsoft Account inside Visual Studio Code to sync all extensions and settings.

## Next Steps

- Download all of essential data that might still be used from Google Drive. Keep data backed up and updated!
- Fetch all currently being worked on projects from GitHub. Just a simple `git clone` will suffice.
- Check the repository every so often to update the commands (should be highly unlikely).
