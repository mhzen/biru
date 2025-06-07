#!/bin/bash

set -ouex pipefail

# dnf 
dnf5 install -y tlp
dnf5 remove -y tuned tuned-ppd

# systemd
systemctl enable tlp

# nix fix
mkdir /nix

# just recipes
echo "import \"/usr/share/biru/biru.just\"" >>/usr/share/ublue-os/justfile

# cleanup
dnf5 clean all -y
rm -rf /tmp/*
find /var/* -maxdepth 0 -type d \! -name cache -exec rm -fr {} \;
find /var/cache/* -maxdepth 0 -type d \! -name libdnf5 \! -name rpm-ostree -exec rm -fr {} \;
mkdir -p /var/tmp
chmod -R 1777 /var/tmp
