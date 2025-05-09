# Setup Nix package manager
setup-nix:
  #!/usr/bin/env bash
  set -euo pipefail

  NIX_INSTALLER="https://install.determinate.systems/nix"

  echo "Setting up Nix package manager..."
  curl --proto '=https' --tlsv1.2 -sSf -L "$NIX_INSTALLER" | sh -s -- install --no-confirm
  echo "Nix setup complete."

# Setup Nix OpenGL system packages
setup-nix-opengl:
  #!/usr/bin/env bash
  set -euo pipefail

  OPENGL_PROFILE="/nix/var/nix/profiles/opengl-driver"
  OPENGL_PROFILE_32="/nix/var/nix/profiles/opengl-driver-32"
  OPENGL_SYMLINK_CONF="/etc/tmpfiles.d/nix-opengl-driver.conf"

  command -v nix &>/dev/null || ujust setup-nix

  echo "Installing Nix system drivers..."
  sudo -i nix profile install --profile "$OPENGL_PROFILE" nixpkgs#{amdvlk,mesa,mesa.opencl,rocmPackages.clr,rocmPackages.clr.icd}

  echo "Installing Nix system 32-bit drivers..."
  sudo -i nix profile install --profile "$OPENGL_PROFILE_32" nixpkgs#driversi686Linux.{amdvlk,mesa}

  echo "Setting up drivers symlink..."
  sudo rm -f "$OPENGL_SYMLINK_CONF"
  printf "L+ /run/opengl-driver - - - - %s\nL+ /run/opengl-driver-32 - - - - %s\n" "$OPENGL_PROFILE" "$OPENGL_PROFILE_32" | sudo tee "$OPENGL_SYMLINK_CONF"
  sudo systemd-tmpfiles --create "$OPENGL_SYMLINK_CONF"

  echo "Nix OpenGL installation complete."

# Install biru flatpaks
install-biru-flatpaks:
  #!/usr/bin/env bash
  set -euo pipefail

  echo "Installing Flatpaks..."
  xargs -a /usr/share/biru/flatpaks.txt flatpak --system -y install
  echo "Flatpaks installation complete."
