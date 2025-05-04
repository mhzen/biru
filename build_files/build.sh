#!/bin/bash

set -ouex pipefail

# Install packages
dnf5 config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_"$(rpm -E %fedora)"/home:manuelschneid3r.repo
dnf5 install -y albert

# Fix nix on F42+
mkdir /nix

# Ujust
echo "import \"/usr/share/biru/biru.just\"" >>/usr/share/ublue-os/justfile
