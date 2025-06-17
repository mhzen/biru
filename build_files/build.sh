#!/bin/bash

set -ouex pipefail

# add repository
dnf5 config-manager addrepo -y --from-repofile=https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_42/home:manuelschneid3r.repo
dnf5 config-manager addrepo -y --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

# enable /opt
mkdir -p /var/opt

# dnf
dnf5 install -y tlp \
                albert \
                brave-browser
dnf5 remove -y tuned tuned-ppd

# disable repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/home:manuelschneid3r.repo

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
