# Setup Nix package manager
setup-nix:
  #!/usr/bin/env bash
  set -euo pipefail

  NIX_INSTALLER="https://install.determinate.systems/nix"

  echo "Setting up Nix package manager..."
  curl --proto '=https' --tlsv1.2 -sSf -L "$NIX_INSTALLER" | sh -s -- install --no-confirm
  echo "Nix setup complete."

# Install biru flatpaks
install-biru-flatpaks:
  #!/usr/bin/env bash
  set -euo pipefail

  echo "Installing Flatpaks..."
  xargs -a /usr/share/biru/flatpaks.txt flatpak --system -y install
  echo "Flatpaks installation complete."
