#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
# pacman -Syu --noconfirm PACKAGESHERE

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package itchio-downloader

# If the application needs to be manually built that has to be done down here
echo "Getting app..."
echo "---------------------------------------------------------------"
itchio-downloader --url "https://rigs-of-rods.itch.itch.io/rigs-of-rods" --platform linux
mkdir -p ./AppDir/bin
tar -xvf rigs-of-rods-linux.zip
mv -v RoR plugins.cfg resources languages content ./AppDir/bin
mv -v lib/* /usr/lib
