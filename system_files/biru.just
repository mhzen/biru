# Setup Nix package manager
setup-nix:
  #!/usr/bin/env bash
  set -euo pipefail

  NIX_DAEMON_SCRIPT="/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
  NIX_INSTALLER="https://install.determinate.systems/nix"

  curl --proto '=https' --tlsv1.2 -sSf -L "$NIX_INSTALLER" | sh -s -- install --no-confirm
  [ -f "$NIX_DAEMON_SCRIPT" ] && . "$NIX_DAEMON_SCRIPT"
  echo "Nix setup complete."

install-zed:
  #!/usr/bin/env bash
  set -euo pipefail

  ZED_INSTALLER="https://zed.dev/install.sh"

  curl --proto '=https' --tlsv1.2 -sSf -L "$ZED_INSTALLER" | sh
  echo "Zed installed."
