#!/bin/bash
# setup for developer

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


# Step 1: Update the OS and Install Xcode Tools
echo "------------------------------"
echo "Updating OSX.  If this requires a restart, run the script again."
# Install all available updates
#sudo softwareupdate -iva
# Install only recommended available updates
sudo softwareupdate -irv

fancy_echo "------------------------------"
fancy_echo "Installing Xcode Command Line Tools."
xcode-select --install


## mac settings and stuff
source macsettings.sh

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


# check for homebrew, then install if it isn't already
if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    append_to_bashrc 'export PATH="/usr/local/bin:$PATH"' 1

    export PATH="/usr/local/bin:$PATH"
fi

# look for old brew-cask
if brew list | grep -Fq brew-cask; then
  fancy_echo "Uninstalling old Homebrew-Cask ..."
  brew uninstall --force brew-cask
fi


# update brew
fancy_echo "Updating Homebrew formulae ..."
tap "caskroom/fonts"
brew update
brew cleanup
brew doctor

# install some apps and packages

brew install git
touch ~/.gitignore
cat .gitignore >> ~/.gitignore

brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install `wget` with IRI support.
brew install wget --with-iri

brew install openssl
brew link --force openssl

brew install bash-completion
brew install htop
brew install node
brew install tree
brew install unrar
brew install ssh-copy-id
cask "font-source-code-pro"
npm install --global fast-cli
brew install ncdu
brew install memtester
brew install martmontools
brew install pv
brew install fuck
append_to_bashrc 'eval "$(thefuck --alias)"'
brew install lolcat
brew install figlet

brew install python
pip install --upgrade setuptools
pip install --upgrade pip

brew install rbenv ruby-build rbenv-default-gems
gem install bundler
echo 'bundler' >> "$(brew --prefix rbenv)/default-gems"
echo "gem: --user-install --no-document -n~/bin" >> ~/.gemrc
gem update --system


fancy_echo "Installing quicklook plugins..."
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webpquicklook
brew cask install suspicious-package

## app installs

printf "Installing the following apps:\nChrome\nCaffeine\nFlux\nAtom\nDropbox\nVirtualbox\nVagrant\nCyberduck\nHipchat\nMacDown\nAppCleaner\niTerm2"
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install caffeine
brew cask install flux
brew cask install appcleaner
brew cask install atom
brew cask install dropbox
brew cask install hipchat
brew cask install cyberduck
brew cask install macdown

brew cask install virtualbox
brew cask install vagrant
printf "Finished installing apps."
printf "Cleaning up..."
brew cleanup
brew cask cleanup

