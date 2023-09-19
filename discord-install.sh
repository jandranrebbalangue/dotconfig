#!/usr/bin/env bash
DISCORD="$1"

if [ -f "$HOME/$DISCORD" ]; then
echo "extracting discord"
sudo tar -xvzf "$DISCORD" -C /opt
echo "create symbolic links"
sudo ln -sf /opt/Discord/Discord /usr/bin/Discord
echo "copy discord desktop to applications"
sudo cp -r /opt/Discord/discord.desktop /usr/share/applications
fi
