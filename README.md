# mac-setup
Shell scripts for setting up a mac. This was written primarily for use in my office so it may include some things you have zero use for, such as Sketch. 

## To Install
	cd
	git clone https://github.com/hayespotter/mac-setup.git && cd mac-setup/
	./run.sh
	
Once the script is complete you can review the output in the log file created at ~/setup.log .

## To Update
	cd ~/mac-setup/
	git pull origin master
	
# Packages
This script installs and configures the following packages:

* Recommended available updates in the App Store
* Xcode Command Line Tools
* Homebrew package manager
* Brew - Git
* Brew - coreutils
* Brew - moreutils
* Brew - findutils
* Brew - openssl
* Brew - bash-completion
* Brew - htop
* Brew - node
* NPM - gulp
* NPM - gulp-sass
* NPM - gulp-concat
* NPM - fast-cli
* NPM - bower
* Brew - tree
* Brew - awk
* Brew - unrar
* Brew - ssh-copy-id
* Brew Cask - font-source-code-pro
* Brew - ncdu
* Brew - memtester
* Brew - smartmontools
* Brew - pv
* Brew - thefuck
* Brew - figlet
* Brew - python
* Brew - rbenv
* Brew - ruby-build
* Brew - rbenv-default-gems
* Gem - bundler
* Gem - lolcat
* Gem - sass

# Applications
This script installs the following apps (via Brew Cask):

* Google Chrome
* Firefox
* iTerm2
* Caffeine (Amphetamine is a lot more powerful but not available via Cask)
* Flux
* Appcleaner
* Atom
* Dropbox
* Hipchat
* MacDown
* Cyberduck
* Sequel Pro
* Virtualbox
* Vagrant
* Sketch (grabs a zip via wget)


# MacOS Settings
This script configures the following settings:

* System - Enable dark mode (PAINT IT BLACK)
* System - Disable boot sound effects
* System - Disable automatic termination of inactive apps
* System - Disable the 'Are you sure you want to open this application?' dialog
* System - Increase window resize speed for Cocoa applications
* System - Disable auto-correct
* System - Disable smart quotes (not useful when writing code)
* System - Disable smart dashes (not useful when writing code)
* System - Require password immediately after sleep or screen saver begins
* System - Avoid creating .DS_Store files on network volumes
* Keyboard - Automatically illuminate built-in MacBook keyboard in low light
* Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes
* Keyboard - Enable keyboard access for all controls
* Keyboard - Set a fast keyboard repeat rate
* Keyboard - Disable press-and-hold for keys in favor of key repeat
* Trackpad- Enable tap to click for current user and the login screen
* Trackpad - Use CONTROL (^) with scroll to zoom
* Trackpad - Follow keyboard focus while zoomed in
* Bluetooth - Increase sound quality for headphones/headsets
* Dock - Remove all default app icons
* Dock - Automatically hide and show
* Dock - Remove the auto-hiding delay
* Dock - Don’t show Dashboard as a Space
* iCloud - Save to disk by default
* Finder - Show the ~/Library folder
* Finder - Show hidden files
* Finder - Show filename extensions
* Finder - Disable the warning when changing a file extension
* Finder - Show path bar
* Finder - Show status bar
* Finder - Display full POSIX path as window title
* Finder - Use list view in all Finder windows
* Finder - Allow text selection in Quick Look
* Chrome - Prevent native print dialog, use system dialog instead
* Mail - Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>
* Mail - Disable send animation
* Mail - Disable reply animation
* Mail - Enable COMMAND+ENTER to send mail
* TextEdit - Use plain text mode for new documents
* TextEdit - Open and save files as UTF-8 encoding
* Disk Utility - Enable debug menu
* Time Machine - Prevent prompting to use new hard drives as backup volume
* Printer - Expand print panel by default
* Printer - Automatically quit printer app once the print jobs complete
* App Store - Enable the WebKit Developer Tools in the Mac App Store
* App Store - Enable Debug Menu in the Mac App Store
* Misson Control - Don’t automatically rearrange Spaces based on most recent use
