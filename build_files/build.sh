#!/bin/bash

set -ouex pipefail

# nix fix
mkdir /nix

# just recipes
echo "import \"/usr/share/biru/biru.just\"" >>/usr/share/ublue-os/justfile
