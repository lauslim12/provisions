# Provisions

This repository is a personal note to me if I ever get a new device in order to make the shifting process as swift as possible. Windows and UNIX systems are divided, as they are not the same. When I got a new laptop / PC, remember to do the following.

## Windows

Windows systems are simple and I don't think the process could get any more straightforward than it is already. First, I am going to configure accounts before doing anything.

- Take care of Windows Updates and Drivers first to prevent any unwanted happenings.
- Log in to Microsoft Account and link it to the device.
- Install [Google Chrome](https://www.google.com/chrome/).

Then, I am going to install applications that I would possibly need.

- Install essential applications, refer to Google Drive for list of essential applications for Windows.
- Install [Genshin Impact](https://genshin.mihoyo.com/) and login to it.
- Enable [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Alternatively, install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) with [elementaryOS](https://elementary.io/).
- Install [Drive Backup and Sync](https://www.google.com/drive/download/) and setup it to guard important folders.
- Install Windows Terminal.

For further steps, refer to 'Manual Configurations' about Google Chrome and more manual setups.

## UNIX Systems

UNIX Systems are a bit different. To provision these devices, I am going to install CLI applications first, before installing the GUI applications. UNIX systems are divided into two: my usual elementaryOS (Ubuntu as base) and MacOS.

### MacOS

Get Git and install Xcode tools.

- `git --version`
- `xcode-select --install`

After that is done, refer to 'Configuring Homebrew' for further steps.

### Ubuntu

This one's a bit different. If I were to use Ubuntu distributions in a virtual machine (VirtualBox), I had to use these commands first. If there's no virtual machine or if I am using WSL, simply skip the following commands.

- `cd /media/<USERNAME>/<GUEST_ADDITIONS_CD>/`
- `sudo sh ./VBoxLinuxAdditions.run`

Replace `<USERNAME>` and `<GUEST_ADDITIONS_CD>` with the appropriate name. After the commands have been executed, turn off the VM, then restart it again to enable full screen (resize guest display).

After that, I am to update dependencies, then install Git and Build Essential.

- `sudo apt update`
- `sudo apt upgrade`
- `sudo apt install build-essential`
- `sudo apt install git`

Next, refer to 'Configuring Homebrew' for further steps.

### Configuring Homebrew

First, install Homebrew as a package manager.

- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

If running Linux, I might have to add the `brew` command to `PATH`, and I might have to install the homebrewed `gcc`. Instructions will be provided after installation.

Configure Homebrew to always use the latest version, use often.

- `brew update`
- `brew doctor`

First off, we're going to install all of the CLI tools that I will most definitely require.

- `brew install node && brew install yarn`
- `brew install python3 && brew install pipenv`

Ensure to always update Homebrew packages.

- `brew outdated`
- `brew upgrade`
- `brew update`

If I ever wanted to export my Homebrew.

- `cd ~`
- `brew bundle dump` will produce `Brewfile`.
- `brew bundle` to install from `Brewfile`.

We're done. Refer to 'Configuring GUI Apps in UNIX Systems' for further steps.

### Configuring GUI Apps in UNIX Systems

If I am on MacOS, the process is extremely straightforward. Just run Homebrew Casks.

- `brew install --cask google-chrome`
- `brew install --cask visual-studio-code`
- `brew install --cask zoom`

If I am on Linux, the process is more complicated. I have to go to their websites and install their applications manually. Similar to Windows.

## Manual Configurations

Configure Google Chrome:

- Log in to all of Google Accounts.
- Setup Google Synchronization (Contacts, Drive, and more).
- Change Privacy and Security to Public DNS.

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
