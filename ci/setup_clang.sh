#!/usr/bin/env bash
#
# Setup clang format
#
# Install clang tools for ubuntu current version
# for more information check:
#   - https://apt.llvm.org/ (LLVM Debian/Ubuntu nightly package page)
#   - wget -O - https://apt.llvm.org/llvm.sh (download automatic install script)
#

# Check for sudo permissions
if ! [ $(id -u) = 0 ];
then
    echo "The script needs to run as root to allow program installation."
    echo "Usage: sudo ./setup_clang.sh"
    exit 1
fi

CLANG_VERSION="14"
CLANG_TOOLS="clang-format"

# Set DISTRIB_CODENAME variable to identify current Ubuntu version
DISTRIB_CODENAME=$(lsb_release -cs)

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository -y "deb http://apt.llvm.org/${DISTRIB_CODENAME}/ llvm-toolchain-${DISTRIB_CODENAME}-$CLANG_VERSION main"
sudo apt update

# Install and set installed version as default value
for tool in $CLANG_TOOLS
do
    tool_version=$tool-$CLANG_VERSION
    sudo apt install -y $tool_version
    # set installed version as default 
    # (taken from github.com/vim/vim repository, ci.yml workflow)
    sudo update-alternatives --install /usr/bin/$tool $tool /usr/bin/$tool_version 100
    sudo update-alternatives --set $tool /usr/bin/$tool_version
done

# check clang tools
for tool in $CLANG_TOOLS
do
    tool_version=$($tool --version | grep "version" | sed -n -e 's/^.*version //p' | awk -F'.' '{print $1}')
    if [[ "$tool_version" != "$CLANG_VERSION" ]]
    then
        echo "Error: $($tool --version)"
        echo "Error: tool version: $tool_version"
        echo "Error: Failed to setup $tool-$CLANG_VERSION"
        exit 1
    else
        echo "$tool setup"
    fi
done

echo "clang-format installed"
exit 0
