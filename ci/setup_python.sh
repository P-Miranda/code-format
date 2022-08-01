#!/usr/bin/env bash
#
# Setup python format
#

# Check for sudo permissions
if ! [ $(id -u) = 0 ];
then
    echo "The script needs to run as root to allow program installation."
    echo "Usage: sudo ./setup_python.sh"
    exit 1
fi

# Install PIP
sudo apt update
sudo apt install python3-pip
python3 -m pip install --upgrade pip

# Install Black
python3 -m pip install black

echo "Python Black installed"
exit 0
