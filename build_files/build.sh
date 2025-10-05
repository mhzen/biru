#!/bin/bash

set -ouex pipefail

# add repos
dnf config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_42/home:manuelschneid3r.repo
dnf copr enable -y alternateved/keyd

# this installs a package from fedora repos
dnf5 install -y fish keyd albert

# for nix compatibility
mkdir /nix
