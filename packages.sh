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
fancy_echo "${bold}==> Updating Homebrew formulae ..."
tap "caskroom/fonts"
brew update
brew cleanup
brew doctor

# install some apps and packages

fancy_echo "${bold}==> Installing utilities..."
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
brew install awk
brew install unrar
brew install ssh-copy-id
cask "font-source-code-pro"
npm install --global fast-cli
brew install ncdu
brew install memtester
brew install martmontools
brew install pv
brew install thefuck
append_to_bashrc 'eval "$(thefuck --alias)"'
brew install lolcat
brew install figlet

fancy_echo "${bold}==> Installing Python..."
brew install python
pip install --upgrade setuptools
pip install --upgrade pip

fancy_echo "${bold}==> Installing and configuring Ruby..."
brew install rbenv ruby-build rbenv-default-gems
gem install bundler
echo 'bundler' >> "$(brew --prefix rbenv)/default-gems"
echo "gem: --user-install --no-document -n~/bin" >> ~/.gemrc
gem update --system


fancy_echo "${bold}==> Installing quicklook plugins..."
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

printf "${bold}==> Installing the following apps:\nChrome\nCaffeine\nFlux\nAtom\nDropbox\nVirtualbox\nVagrant\nCyberduck\nHipchat\nMacDown\nAppCleaner\niTerm2"
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
printf "${bold}==> Finished installing apps."
printf "${bold}==> Cleaning up..."
brew cleanup
brew cask cleanup
