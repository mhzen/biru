#!/bin/bash

set -ouex pipefail

# enable repo
dnf5 copr enable -y alternateved/keyd
dnf5 config-manager addrepo -y --from-repofile=https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_42/home:manuelschneid3r.repo

# install package
dnf5 install -y keyd fish albert

# nix fix
mkdir /nix

# just recipes
echo "import \"/usr/share/biru/biru.just\"" >>/usr/share/ublue-os/justfile
