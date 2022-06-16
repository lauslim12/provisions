# Provisions

This repository is my digital toolbox, a personal note to me if I ever get a new device in order to make the shifting process as swift as possible. In order to separate the concerns between personal use and development, please do not use the same device for work and personal matters (my personal preference is Windows machines for personal use and Unix systems for software engineering).

The provisioning process is automated using [Ansible](https://www.ansible.com/), an Infrastructure-as-Code.

## Structure

The project is structured like the following:

- `dotfiles` contains my personal dotfiles configuration for Terminal. It also contains my Visual Studio Code settings.
- `scripts` contains useful scripts for performing utility matters, such as updating Homebrew cleanly.
- `setup` contains Ansible files in order to provision / setup a device for the first time.

## Notes

Some notes to keep in mind before provisioning your device:

- Make sure you get a PC with Intel processors. Homebrew (for Linux) does not support ARM processors.
- You have to use either Darwin/Debian-based Linux.
- I am a 'minimalist' developer. I don't really have any personal configurations other than the synchronized one in Visual Studio Code and my simple dotfiles.
- We keep everything simple in local machine, and we can use Docker if we need more complicated tools (databases, caches, etcetera).
- If you need to add an environment variable, instead of appending them to the `.bash_profile` or `.zshrc`, please append it to `exports.sh` instead.

## Preparations

Before starting to automatically configure stuff, we have to configure our machine manually first.

For Windows:

- Take care of Windows Updates and Drivers first to prevent any unwanted happenings.
- Log in to Microsoft Account, link it to the device, setup synchronizations (settings, accounts).

For MacOS:

- Take care of Apple Updates.
- Log in to iCloud. Setup synchronizations and settings.

For Ubuntu/Linux:

- Update software using `sudo apt update` and `sudo apt upgrade`.
- You might have to `sudo apt install build-essential` for the `make` command.

Remember that you can always not install all applications - you can comment out applications that you do not want to install before running `make setup`.

## Setup: Windows

My personal preference is that I will try to avoid programming in Windows for separation of concerns between my personal life and my development life. Windows machines are simple and I don't think the process could get any more straightforward than it is already. I usually provision my Windows devices like the following steps:

- Install [Google Chrome](https://www.google.com/chrome/).
- Install [Google Drive](https://www.google.com/drive/download/) and setup it to guard important folders.
- Install other essential applications, refer to Google Drive for list of essential applications for Windows.

## Setup: MacOS / Debian

For my software engineering device (should be UNIX-based systems), please follow below steps to get your device provisioned!

- Initially, we have to start by installing Git on Debian or Xcode on MacOS:

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

- Create a folder named `Projects`, capital P. This is important, as mainly the `provisions` repo will be placed inside here. If you take a look at `dotfiles/.main`, the path is hardcoded to this location. Don't forget to symlink the `Projects` folder to your Desktop (if necessary).

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
make update-linux # if running on Debian-based Linux
```

## Update

Updating the packages can be done by typing the following commands:

```bash
# for homebrew
make update-homebrew

# for apt/linux
make update-linux

# for npm
make update-npm
```

You can use all commands in order to update all package managers!

## Manual Configurations

After you have configured everything in your system, it's time to do some manual works.

Configure MacOS:

- Run `sh dotfiles/macos.sh` to set up sensible, customized defaults.
- Finder -> Preferences -> Show Home Folder in Sidebar & Show Mac.
- Allow 'night mode' to change the color of the screen to a warmer one during sunset to sunrise.
- Tidy up dock and desktop icons.

Configure Windows:

- Settings -> Taskbar -> Automatically Hide Taskbar in Desktop
- Allow 'night mode' to change the color of the screen to a warmer one during sunset to sunrise.
- Tidy up taskbar and desktop icons.
- If using WSL, install Windows Terminal for better terminal experience.

Configure Google Chrome:

- Log in to all of Google Accounts and all webservices that I use.
- Setup Google Synchronization (Contacts, Drive, Calendar, and more).
- Change Privacy and Security to Public DNS.

Configure Visual Studio Code:

- Log in to Microsoft Account inside Visual Studio Code to sync all of my extensions and settings.
- If somehow the settings are lost, you can use the exact same one in `dotfiles/.vscode/settings.json` and `dotfiles/.vscode/extensions.sh`.
- Configure that by copying `settings.json`, and executing `sh dotfiles/.vscode/extensions.sh`.

## Next Steps

- Download all of essential data that might still be used from Google Drive. Keep data backed up and updated!
- Fetch all currently being worked on projects from GitHub. Just a simple `git clone` will suffice.
- Once a week, please update all dependencies by using the available commands.
- Don't forget to check for updates for your system at all times.
- Check the repository once in a while to update the commands and links (should be highly unlikely).
