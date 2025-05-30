#!/bin/bash

set -ouex pipefail

# Add repo
dnf5 config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_"$(rpm -E %fedora)"/home:manuelschneid3r.repo

# Install packages
dnf5 install -y \
  albert \
  tlp tlp-rdw \
  gnome-shell-extension-pop-shell

# Remove packages
dnf5 remove -y \
  tuned tuned-ppd \
  bazaar

# Enable services
systemctl enable tlp

# Fix nix on F42+
mkdir /nix

# Ujust
echo "import \"/usr/share/biru/biru.just\"" >>/usr/share/ublue-os/justfile
