#!/usr/bin/zsh
killall signal-desktop
sudo sed -i 's/signal-desktop --no-sandbox %U/signal-desktop --use-tray-icon --no-sandbox %U/g' /usr/share/applications/signal-desktop.desktop
