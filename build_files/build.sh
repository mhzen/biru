#!/bin/bash

set -ouex pipefail

# enable repo
dnf5 copr enable -y alternateved/keyd

# install package
dnf5 install -y keyd fish

# nix fix
mkdir /nix

# just recipes
echo "import \"/usr/share/biru/biru.just\"" >>/usr/share/ublue-os/justfile
