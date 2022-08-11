# Provisions

This repository is my digital toolbox, a personal note to me if I ever get a new device in order to make the shifting process as swift as possible. In order to separate the concerns between personal use and development, please do not use the same device for work and personal matters (my personal preference is Windows machines for personal use and Unix systems for software engineering). I will try to avoid programming in Windows for separation of concerns between my personal life and my development life. Windows machines are simple and I don't think the process could get any more straightforward than it is already.

The provisioning process is automated using [Ansible](https://www.ansible.com/), an Infrastructure-as-Code.

## Structure

The project is structured like the following:

- `dotfiles` contains my personal dotfiles for `iTerm2`, `oh-my-zsh`, `vscode`, and ordinary Terminal dotfiles.
- `scripts` contains useful scripts for performing utility matters, such as updating Homebrew cleanly.
- `setup` contains Ansible files in order to provision / setup a device for the first time.

## Notes

Some notes to keep in mind before provisioning your device:

- Make sure you get a PC with Intel processors. Homebrew (for Linux) does not support ARM processors.
- You have to use either Darwin/Debian-based Linux.
- I am a 'minimalist' developer. I don't really have any personal configurations other than the synchronized one in Visual Studio Code and my simple dotfiles.
- We keep everything simple in local machine, and we can use Docker if we need more complicated tools (databases, caches, etcetera).
- If you need to add an environment variable, instead of appending them to `.zshrc`, please append it to `exports.sh` instead (use `putenv`).
- Several `zsh` themes are available through `oh-my-zsh`.

## Preparations

Before starting to automatically configure stuff, we have to configure our machine manually first.

For Windows:

- Take care of Windows Updates and Drivers first to prevent any unwanted happenings.
- Log in to Microsoft Account, link it to the device, setup synchronizations (settings, accounts).
- Install Chrome, Drive, and essential applications. This should not be the main development machine if possible.

For MacOS:

- Take care of Apple Updates.
- Log in to iCloud. Setup synchronizations and settings.

For Ubuntu/Linux:

- Update software using `sudo apt update` and `sudo apt upgrade`.
- Install `zsh` and set it to as the default Shell: `sudo apt install zsh` and `chsh -s $(which zsh)`.
- You might have to `sudo apt install build-essential` for the `make` command.

Remember that you can always not install all applications - you can comment out applications that you do not want to install before running `make setup`.

## Setup

- Initially, we have to start by installing `git` on Debian or `xcode-select` on MacOS:

```bash
# Debian
sudo apt install git

# MacOS
xcode-select --install
```

- Configure Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible
brew install git
```

- Install [Google Chrome](https://www.google.com/chrome/) as a web browser.

- Setup global configurations for Git. After that is done, generate [SSH key for GitHub](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). Then, [add it to your GitHub account](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account). Finally, don't forget to test your connection and remember to [verify the RSA fingerprint](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/testing-your-ssh-connection).

```bash
git config --global user.email <MY_GITHUB_EMAIL>
git config --global user.name <MY_GITHUB_USERNAME>
ssh -T git@github.com
```

- Create a folder named `Projects`. This is important, as mainly the `provisions` repo will be placed inside here. If you take a look at `dotfiles/main.sh`, the path is hardcoded to this location. Don't forget to symlink the `Projects` folder to your Desktop (if necessary).

```bash
mkdir -p ~/Projects
ln -s ~/Projects ~/Desktop/Projects
cd Projects
```

- Clone repository and run Ansible.

```bash
git clone git@github.com:lauslim12/provisions.git
cd provisions
make setup
```

- Clean up Ansible and clean up Homebrew remains.

```bash
brew remove ansible
make update-homebrew
make update-linux # if running a Debian-based Linux
```

## Scripts

With the help of `Makefile`, several commands have been made to act as shortcuts to ease up the provisioning and update process. Make sure you are in the `provisions` folder before using these commands.

- `make setup`, to setup/provision your whole device.
- `make update-homebrew`, to update Homebrew packages.
- `make update-linux`, to update Linux (Debian-based) with the `apt` package manager.
- `make update-npm`, to update `npm` itself and global `npm` packages.

## Manual Configurations

After you have configured everything in your system, it's time to do some manual works.

Configure MacOS:

- Finder -> Preferences -> Show Home Folder in Sidebar & Show Mac.
- System Preferences -> Keyboard -> Input Sources -> Add Japanese - Romaji.
- System Preferences -> Keyboard -> Shortcuts -> Input Sources -> Check both.
- System Preferences -> Night Shift -> Schedule night light.
- Tidy up dock and desktop icons.

Configure iTerm2:

- iTerm2 -> Preferences -> Profiles -> Other Actions -> Import JSON Profiles.
- iTerm2 -> Preferences -> Profiles -> Other Actions -> Set as Default.
- iTerm2 -> Preferences -> Appearance -> Status Bar Location -> Bottom.

Configure Windows:

- Settings -> Taskbar -> Automatically Hide Taskbar in Desktop.
- Settings -> Night Light - Configure Night Light.
- Tidy up taskbar and desktop icons.
- If using WSL, install `Windows Terminal` for better terminal experience.

Configure Google Chrome:

- Log in to all of Google Accounts and all webservices that I use.
- Setup Google Synchronization (Contacts, Drive, Calendar, and more).
- Change Privacy and Security to Public DNS.

Configure Visual Studio Code:

- Log in to Microsoft Account inside Visual Studio Code to sync all of my extensions and settings.
- My settings and extensions can be found in `dotfiles/vscode`.

## Next Steps

- Download all of essential data that might still be used from Google Drive. Keep data backed up and updated!
- Fetch all currently being worked on projects from GitHub. Just a simple `git clone` will suffice.
- Once a week, please update all dependencies by using the available commands.
- Don't forget to check for updates for your system at all times.
- Check the repository once in a while to update the commands and links (should be highly unlikely).
