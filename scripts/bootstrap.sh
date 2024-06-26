#!/usr/bin/env bash

##
# bootstrap.sh
#
# Script to set up everything on this machine. Contains specific OS settings and has guards in place to ensure that it still stays sane. If
# you want to run this script, please follow the instructions specified in `README.md` file.
##

###############################################################################
# Constants and Utilities                                                     #
###############################################################################

# Unique strings to be used as constants throughout the whole script.
DOTFILES_NAME=.myconfig.zsh
PROJECTS_DIRECTORY=$HOME/Projects
PROVISIONS_DIRECTORY=$HOME/Projects/provisions

# Special colors to colorize the I/O of the standard output.
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'

# banner is used to print a line break and a message to show/explain the process of the script while it is running.
banner() {
  if [[ $# -eq 0 ]]; then
    echo "The function requires an argument, which is a string. This is a programmer's error, please tell the engineer to fix it as soon as possible."
    exit 1
  fi

  echo
  echo "###############################################################################"
  echo "⮕  $1"
  echo "###############################################################################"
  echo
}

# message is used to print a message unique to this script, colorized and requires an argument (string).
message() {
  if [[ $# -eq 0 ]]; then
    echo "The function requires an argument, which is a string. This is a programmer's error, please tell the engineer to fix it as soon as possible."
    exit 1
  fi

  echo -e "${GREEN}[♦ ♦ ♦]${RESET} $1"
}

# skip is used to print a skipped step message, unique to this script, colorized and requires an argument (string).
skip() {
  if [[ $# -eq 0 ]]; then
    echo "The function requires an argument, which is a string. This is a programmer's error, please tell the engineer to fix it as soon as possible."
    exit 1
  fi

  echo -e "${YELLOW}[♦ ♦ ♦]${RESET} $1"
}

# todo is used to print out things that needs to be done after the whole bootstrap process is complete.
todo() {
  if [[ $# -eq 0 ]]; then
    echo "The function requires an argument, which is a string. This is a programmer's error, please tell the engineer to fix it as soon as possible."
    exit 1
  fi

  echo -e "${BLUE}[♦ ♦ ♦]${RESET} $1"
}

###############################################################################
# Initialization                                                              #
###############################################################################

banner "Initialization"

# Ensure that the user does not run this script by accident.
read -r -p "Confirmation needed: Do you want to provision your PC with my settings? Please review this script before running it! [y|N]: " response
if [[ $response =~ (y|yes|Y) ]]; then
  message "Consent given, starting provisioning process..."
else
  message "Aborted, user does not consent to installation."
  exit 1
fi

# Check whether this device is a personal device or a professional device.
if [[ $WORK == "TRUE" ]]; then
  message "This device is provisioned for professional usage."
else
  message "This device is provisioned for personal usage."
fi

# Create `Projects` folder if it does not exist yet.
message "Creating 'Projects' folder as the main workspace if it does not exist yet..."
if [[ -d $PROJECTS_DIRECTORY ]]; then
  skip "The 'Projects' folder exists, skipping this step..."
else
  message "The 'Projects' folder does not exists, creating that folder..."
  mkdir -p $PROJECTS_DIRECTORY
fi

# Symlink `Projects` to `Desktop` directory if needed.
message "Symlinking 'Projects' alias to the 'Desktop' folder..."
if [[ -d "$HOME/Desktop" && ! -L "$HOME/Desktop/Projects" && ! -d "$HOME/Desktop/Projects" ]]; then
  message "Creating symbolic link for 'Projects' folder in the 'Desktop'..."
  ln -s $HOME/Projects $HOME/Desktop/Projects
else
  skip "The 'Projects' alias has already existed in the 'Desktop' (or 'Desktop' folder does not exist), skipping this step..."
fi

# Clone `provisions` repository through HTTPS in `Projects` folder.
message "Cloning 'lauslim12/provisions' to the '$PROJECTS_DIRECTORY' directory..."
if [[ -d $PROVISIONS_DIRECTORY ]]; then
  skip "Repository 'lauslim12/provisions' already exists in that directory, skipping this step..."
else
  message "Cloning 'lauslim12/provisions' repository into that folder..."
  git clone https://github.com/lauslim12/provisions.git $PROJECTS_DIRECTORY
fi

###############################################################################
# Homebrew                                                                    #
###############################################################################

banner "Homebrew"

# Check Brew installation, install if not installed.
message "Checking Homebrew installation, if Homebrew is not installed, then it will be installed..."
if [[ $(command -v brew) == "" ]]; then
  message "Homebrew not installed, installing Hombrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  skip "Homebrew is installed, this step is skipped..."
fi

# Updates and upgrades Homebrew.
message "Updating Homebrew and upgrading Homebrew packages..."
brew update && brew upgrade

# Install Brew command line applications.
message "Installing command line applications with Homebrew..."
brew install fnm fzf gcc git go pipx pyenv

# Install GUI applications (Casks) for MacOS only.
message "Installing GUI applications for MacOS..."
if [[ $OSTYPE == 'darwin'* ]] && [[ $WORK == 'TRUE' ]]; then
  brew install --cask docker iterm2 slack stats visual-studio-code zoom
elif [[ $OSTYPE == 'darwin'* ]]; then
  brew install --cask docker iterm2 stats visual-studio-code zoom
else
  skip "OS is not MacOS, skipping..."
fi

# Clean up Homebrew.
message "Cleaning up unused Homebrew dependencies and removing stale lock files and outdated downloads..."
brew cleanup && brew autoremove

# Validate Homebrew works.
message "Validating Homebrew's health..."
brew doctor

###############################################################################
# Additional Command Line Applications                                        #
###############################################################################

banner "Additional Command Line Applications"

# Install `oh-my-zsh` for Terminal management.
message "Installing 'oh-my-zsh' for beautiful Terminal themes..."
if [[ -d $HOME/.oh-my-zsh ]]; then
  skip "Terminal library 'oh-my-zsh' is already installed, skipping this step..."
else
  message "Installing 'oh-my-zsh'..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

###############################################################################
# Terminal                                                                    #
###############################################################################

banner "Terminal"

# Install `fzf` autocompletions.
message "Installing 'fzf' autocompletions..."
if [[ -f $HOME/.fzf.zsh ]]; then
  skip "Terminal library 'fzf' has already had its autocompletes installed, skipping..."
else
  message "Installing autocompletions for `fzf`..."
  $(brew --prefix)/opt/fzf/install
fi

# Symlink personal configurations into the user's home directory, change the name to `$DOTFILES_NAME`.
message "Symlinking personal configurations into the user's home directory..."
if [[ -f $HOME/$DOTFILES_NAME ]]; then
  skip "Symlink '$DOTFILES_NAME' has already existed, skipping this step..."
else
  message "Creating symlink for the Shell configurations..."
  ln -s $PROVISIONS_DIRECTORY/dotfiles/main.sh $HOME/$DOTFILES_NAME
fi

# Source personal configuration to the user's `.zshrc` for portability/flexibility.
message "Appending to '.zshrc' to source '$DOTFILES_NAME'..."
if [[ $(cat "$HOME/.zshrc" | grep -c "source $HOME/$DOTFILES_NAME") -eq 0 ]]; then
  message "Symlinking the configuration to the Shell file..."
  echo "source $HOME/$DOTFILES_NAME" >> $HOME/.zshrc
else
  skip "Configuration has already been appended to '.zshrc', skipping this step..."
fi

###############################################################################
# MacOS                                                                       #
###############################################################################

banner "MacOS"

# Prompt the user to install my personal MacOS's sensible defaults.
message "Preparing sensible defaults for MacOS only..."
if [[ ! $OSTYPE == 'darwin'* ]]; then
  skip "OS type is not MacOS, skipping this step..."
fi

# Request permission from the user to do the update - some companies might have a special policy for devices, please consult with your company.
if [[ $OSTYPE == 'darwin'* ]]; then
  read -r -p "Confirmation needed: Do you want to set up your Mac with sensible defaults? Some companies have policies with/against this. [y|N]: " response

  if [[ $response =~ (y|yes|Y) ]]; then
    message "Setting up sensible defaults for MacOS... (you may be asked for your password)"
    sh ./scripts/macos.sh
  else
    skip "Skipping MacOS's default configurations..."
  fi
fi

###############################################################################
# Finish                                                                      #
###############################################################################

banner "Finishing!"

# Tell user what do to after this.
todo "The next thing to do is that you should do the following steps (manually) to completely provision your machine:"
todo "1. Set up Google Chrome."
todo "2. Set up Git and SSH keys."
todo "3. Install 'poetry' as Python package manager by using 'pipx'"
todo "4. Install 'pnpm' package manager for Node.js as it couldn't be automated"
todo "5. Set up other applications as described in the 'provisions' repository!"
todo "6. If you downloaded this repository and it is not in '$PROJECTS_DIRECTORY', please delete this repository as you will not need it anymore (you will use the '$PROVISION_DIRECTORY' next time)."
todo "Please do the remaining manual configurations by reading my repository and doing them all manually!"
todo "GitHub Repository: https://github.com/lauslim12/provisions (open in your web browser)."

# Print an empty line for Terminal completeness - beautiful and consistent Terminal output.
echo

# Done! Print a success message to the user then!
message "Device has been successfully set up. Please reload the shell 👍"
message "Please note that some services may require a complete restart of the machine!"
message "Thank you for provisioning your device. See you next time! 👋"

# Print an empty line for Terminal completeness - beautiful and consistent Terminal output.
echo
