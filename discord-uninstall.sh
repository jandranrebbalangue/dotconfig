#!/usr/bin/env bash

echo "remove discord inside config"
sudo rm -r ~/.config/discord
echo "remove discord inside opt"
sudo rm -rf /opt/Discord
echo "remove discord in bin"
sudo rm /usr/bin/Discord
echo "remove discord in applications"
sudo rm /usr/share/applications/discord.desktop
