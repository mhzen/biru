# Biru
A bunch tiny modification over `bluefin-dx`

### List of changes
- Replace tuned (and tuned-ppd) with tlp
- Add a [fix for nix-installer](https://github.com/DeterminateSystems/nix-installer/issues/1445) in F42+ atomic
- Add an ujust command to install nix using [nix-installer](https://github.com/DeterminateSystems/nix-installer)

# Usage
From an existing bluefin installation:
1. Rebase to the unsigned image and reboot
```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mhzen/biru:latest
```
2. Rebase to the signed image and reboot
```
rpm-ostree rebase ostree-image-signed:ghcr.io/mhzen/biru:latest
```

# Documentation
Refer to [ublue-os/image-template](https://github.com/ublue-os/image-template)
