#!/bin/bash

# Applies system and application settings

# ask for sudo password up front
sudo -v
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""

printf "System - Enabling dark mode"
sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

printf "System - Disable boot sound effects\n"
sudo nvram SystemAudioVolume=" "

printf "System - Disable automatic termination of inactive apps\n"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true


printf "System - Disable the 'Are you sure you want to open this application?' dialog\n"
defaults write com.apple.LaunchServices LSQuarantine -bool false

printf "System - Increase window resize speed for Cocoa applications\n"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001


printf "System - Disable auto-correct\n"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

printf "System - Disable smart quotes (not useful when writing code)\n"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

printf "System - Disable smart dashes (not useful when writing code)\n"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

printf "System - Require password immediately after sleep or screen saver begins\n"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

printf "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "Keyboard - Automatically illuminate built-in MacBook keyboard in low light\n"
defaults write com.apple.BezelServices kDim -bool true

printf "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes\n"
defaults write com.apple.BezelServices kDimTime -int 300

printf "Keyboard - Enable keyboard access for all controls\n"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

printf "Keyboard - Set a fast keyboard repeat rate\n"
defaults write NSGlobalDomain KeyRepeat -int 0

printf "Keyboard - Disable press-and-hold for keys in favor of key repeat\n"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

printf "Trackpad - Map bottom right corner to right-click\n"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

printf "Trackpad - Enable tap to click for current user and the login screen\n"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

printf "Trackpad - Use CONTROL (^) with scroll to zoom\n"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

printf "Trackpad - Follow keyboard focus while zoomed in\n"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

printf "Bluetooth - Increase sound quality for headphones/headsets\n"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40


printf "Dock - Remove all default app icons\n"
defaults write com.apple.dock persistent-apps -array

printf "Dock - Automatically hide and show\n"
defaults write com.apple.dock autohide -bool true

printf "Dock - Remove the auto-hiding delay\n"
defaults write com.apple.Dock autohide-delay -float 0

printf "Dock - Don’t show Dashboard as a Space\n"
defaults write com.apple.dock "dashboard-in-overlay" -bool true

printf "iCloud - Save to disk by default\n"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

printf "Finder - Show the $HOME/Library folder\n"
chflags nohidden $HOME/Library

printf "Finder - Show hidden files\n"
defaults write com.apple.finder AppleShowAllFiles -bool true

printf "Finder - Show filename extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "Finder - Disable the warning when changing a file extension\n"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "Finder - Show path bar\n"
defaults write com.apple.finder ShowPathbar -bool true

printf "Finder - Show status bar\n"
defaults write com.apple.finder ShowStatusBar -bool true

printf "Finder - Display full POSIX path as window title\n"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

printf "Finder - Use list view in all Finder windows\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


printf "Finder - Allow text selection in Quick Look\n"
defaults write com.apple.finder QLEnableTextSelection -bool true


printf "Chrome - Prevent native print dialog, use system dialog instead\n"
defaults write com.google.Chrome DisablePrintPreview -boolean true

printf "Mail - Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'\n"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

printf "Mail - Disable send animation\n"
defaults write com.apple.mail DisableSendAnimations -bool true

printf "Mail - Disable reply animation\n"
defaults write com.apple.mail DisableReplyAnimations -bool true

printf "Mail - Enable COMMAND+ENTER to send mail\n"
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

printf "TextEdit - Use plain text mode for new documents\n"
defaults write com.apple.TextEdit RichText -int 0

printf "TextEdit - Open and save files as UTF-8 encoding\n"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

printf "Disk Utility - Enable debug menu\n"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

printf "Time Machine - Prevent prompting to use new hard drives as backup volume\n"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

printf "Printer - Expand print panel by default\n"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

printf "Printer - Automatically quit printer app once the print jobs complete\n"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

printf "App Store - Enable the WebKit Developer Tools in the Mac App Store\n"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

printf "App Store - Enable Debug Menu in the Mac App Store\n"
defaults write com.apple.appstore ShowDebugMenu -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false