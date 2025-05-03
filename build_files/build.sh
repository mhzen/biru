#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 install -y ulauncher

# Fix nix on F42+
mkdir /nix

# Ujust
echo "import \"/usr/share/biru/biru.just\"" >>/usr/share/ublue-os/justfile
