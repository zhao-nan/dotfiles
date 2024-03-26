#!/usr/bin/zsh
# This script will download and install the Zoom client

ZOOM_DEB='zoom_amd64.deb'

version_installed=$(cat /opt/zoom/version.txt)
version_available=$(wget --spider https://zoom.us/client/latest/zoom_amd64.deb 2>&1 | grep Location | sed -e 's/.*prod\/\(.*\)\/.*/\1/')

echo "Installed: ${version_installed}"
echo "Available: ${version_available}"

if [[ "${version_installed}" == "${version_available}" ]]; then
    echo "The latest version is installed. Exiting."
else
    curl -J -L -o /tmp/${ZOOM_DEB} https://www.zoom.us/client/latest/${ZOOM_DEB}

    sudo dpkg --install /tmp/${ZOOM_DEB}
    sudo apt install -f
fi
