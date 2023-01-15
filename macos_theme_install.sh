#!/bin/bash
# Written by JAN

echo "Welcome to 'MacOS Theme installation'!"
echo "You must be root! Tipp: You can type in Terminal 'su' and you're root."

# Check if git is installed
echo "Checking if git is installed"
if ! [ -x "$(command -v git)" ]; then
    echo "Git is not installed. Installing git using apt..."
    # Install git using apt
    sudo apt install git -y
else
    echo "Git is already installed."
fi

# Ask user which icon theme they want
echo "Which icon theme would you like to install? (1) Ventura (2) Catalina"
read themeChoice

# Go to /usr/share/icons
echo "Change Directory to /usr/share/icons"
cd /usr/share/icons

# Check if icons are already installed
if [ $themeChoice -eq 1 ]
then
    if [ -d "Cupertino-Ventura-iCons" ]; then
        echo "Ventura icons are already installed. Skipping icon installation."
    else
        echo "Download Ventura Icons: Cupertino-Ventura-iCons from USBA - github.com"
        git clone https://github.com/USBA/Cupertino-Ventura-iCons.git
        echo "Done with icon Downloading"
    fi
elif [ $themeChoice -eq 2 ]
then
    if [ -d "Os-Catalina-icons" ]; then
        echo "Catalina icons are already installed. Skipping icon installation."
    else
        echo "Download Catalina Icons from zayronxio - github.com"
        git clone https://github.com/zayronxio/Os-Catalina-icons.git
        echo "Done with icon Downloading"
    fi
else
    echo "Invalid choice. Exiting script."
    exit 1
fi

# Check if WhiteSur theme is already installed
if find ~ -name 'WhiteSur-*' -type d | grep -q 'WhiteSur'; then
  echo "WhiteSur theme is already installed. Skipping theme installation."
else
    # Download WhiteSur-gtk-theme
    echo "Create Directory /WhiteSurGit and download WhiteSur-gtk-theme from vinceliuice - github.com"

    mkdir /WhiteSurGit
    cd /WhiteSurGit
    git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
    cd WhiteSur-gtk-theme

    # Install theme
    echo "Install theme"
    bash install.sh

    # Remove /WhiteSurGit
    echo "REMOVE /WhiteSurGit because we don't need any more!"
    rm -r /WhiteSurGit
fi

echo "Done. Try to change the theme and icons of your system. Enjoy :-)"
