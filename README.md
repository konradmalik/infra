![Ubuntu Jammy lima-vm](https://github.com/konradmalik/infra/actions/workflows/jammy-lima.yaml/badge.svg)
![Arch Linux lima-vm](https://github.com/konradmalik/infra/actions/workflows/arch-lima.yaml/badge.svg)
![Arch Linux docker](https://github.com/konradmalik/infra/actions/workflows/docker.yaml/badge.svg)

# Personal infrastructure

## Cloud

Just my personal terrafrom.

## Environments

### Ansible

Works for:

- Archlinux (amd64)
- Ubuntu (22.04)
  - amd64
  - aarch64

Currently this is aimed at machines on which I cannot install NixOS or which I cannot manage on a host level like with `nix-darwin` for example.

For all the rest (I try to maximalise this) I use NixOS/nix-darwin via [this dotfiles config](https://github.com/konradmalik/dotfiles).

ATTENTION: You really should know what you're doing when applying this. It's personalized and clones my dotfiles repo among other things.

To use, proceed with README in `environments/dev/ansible` dir.

### Lima

Configurations for lima VMs that I sometimes use on my MacBook.

### Qemu

QEMU scripts for a VM that I used to use on my MacBook.
