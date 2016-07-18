#### redefined variables so you can run this script by itself if need be
bold=$(tput bold)
normal=$(tput sgr0)

# check for homebrew, then install if it isn't already
if ! command -v brew >/dev/null; then
  fancy_echo "${bold}==> Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    append_to_bashrc 'export PATH="/usr/local/bin:$PATH"' 1

    export PATH="/usr/local/bin:$PATH"
fi

# look for old brew-cask
if brew list | grep -Fq brew-cask; then
  fancy_echo "${bold}==> Uninstalling old Homebrew-Cask ..."
  brew uninstall --force brew-cask
fi


# update brew
fancy_echo "------------------------------"
fancy_echo "${bold}==> Updating Homebrew formulae ..."
brew tap "caskroom/fonts"
brew update
brew cleanup
brew doctor

# install some apps and packages

fancy_echo "------------------------------"
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
npm install --global gulp
npm install --global gulp-sass
npm install --global gulp-concat
npm install --global fast-cli
npm install --global bower
brew install tree
brew install awk
brew install unrar
brew install ssh-copy-id
brew cask install "font-source-code-pro"
brew install ncdu
brew install memtester
brew install smartmontools
brew install pv
brew install thefuck
append_to_bashrc 'eval "$(thefuck --alias)"'
brew install figlet

fancy_echo "------------------------------"
fancy_echo "${bold}==> Installing Python..."
brew install python
pip install --upgrade setuptools
pip install --upgrade pip

fancy_echo "------------------------------"
fancy_echo "${bold}==> Installing and configuring Ruby..."
brew install rbenv ruby-build rbenv-default-gems
gem install bundler
echo 'bundler' >> "$(brew --prefix rbenv)/default-gems"
echo "gem: --user-install --no-document -n~/bin" >> ~/.gemrc
gem install lolcat
gem install sass
gem update --system


fancy_echo "------------------------------"
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

fancy_echo "------------------------------"
fancy_echo "${bold}==> Installing some apps"
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
brew cask install sequel-pro
brew cask install macdown
brew cask install virtualbox
brew cask install vagrant

wget https://www.sketchapp.com/static/download/sketch.zip
unzip -q sketch.zip
rm -rf sketch.zip __MACOSX/
cp -rf Sketch.app /Applications
rm -rf Sketch.app/

fancy_echo "------------------------------"
fancy_echo "${bold}==> Finished installing apps."
fancy_echo "${bold}==> Cleaning up..."
brew cleanup
brew cask cleanup