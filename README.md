# Biru

[![bluebuild build badge](https://github.com/mhzen/biru/actions/workflows/build.yml/badge.svg)](https://github.com/mhzen/biru/actions/workflows/build.yml)

Bunch of opinionated and personal changes over Bluefin-dx:

- Based on stable tag of Bluefin-dx
- Add Ulauncher
- DoT enabled by default (Adguard and Cloudflare)
- Add ujust command to install Nix
- Fix Nix support in F42+

> [!IMPORTANT]
> This image is intended for personal use. Expect frequent changes.

## Installation

> [!WARNING]
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing Universal Blue / Fedora Atomic installation:

- First rebase to the image:
  ```
  bootc switch --enforce-container-sigpolicy ghcr.io/mhzen/biru:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
