#!/bin/sh

# Upgrade the entire system
sudo pacman -Syu

# Update any installed flatpaks
sudo flatpak update

# Update installed snaps
sudo snap update
