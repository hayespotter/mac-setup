#!/bin/bash

fancy_echo() {
  local fmt="$1"; shift
  
  printf "\n$fmt\n" "$@"
}

append_to_bashrc() {
  local text="$1" bashrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.bashrc.local" ]; then
    bashrc="$HOME/.bashrc.local"
  else
    bashrc="$HOME/.bashrc"
  fi

  if ! grep -Fqs "$text" "$bashrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$bashrc"
    else
      printf "\n%s\n" "$text" >> "$bashrc"
    fi
  fi
}

bold=$(tput bold)
normal=$(tput sgr0)

# ask for sudo password up front
sudo -v
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


if [ ! "$1" = "designer" ]; then
  fancy_echo "------------------------------"
  fancy_echo "${bold}==> Setting Mac up for a developer"
else 
  fancy_echo "------------------------------"
  fancy_echo "${bold}==> Setting Mac up for a designer"
fi

# Step 1: Update the OS and Install Xcode Tools
fancy_echo "------------------------------"
fancy_echo "${bold}==> Updating MacOS. If this requires a restart, run the script again."
# Install all available updates
#sudo softwareupdate -iva
# Install only recommended available updates
sudo softwareupdate -irv

fancy_echo "------------------------------"
fancy_echo "${bold}==> Installing Xcode Command Line Tools."
xcode-select --install


if [ "$1" = "no-settings" ]; then
  fancy_echo "${bold}==> Skipping mac settings file."
else
  ## mac settings and stuff
  source macsettings.sh
fi


## setup bash profile with some useful stuff
touch ~/.bash_profile
cat .bash_profile >> ~/.bash_profile

# if ~/.bin doesn't exist, create it
if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

# if .bashrc doesn't exist, create it
if [ ! -f "$HOME/.bashrc" ]; then
  touch "$HOME/.bashrc"
fi

# add ~/.bin to PATH
append_to_bashrc 'export PATH="$HOME/.bin:$PATH"'

## install packages
source packages.sh

fancy_echo "------------------------------"
fancy_echo "${bold}==> Script complete."