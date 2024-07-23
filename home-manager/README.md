## home-manager 

This directory contains my home-manager configuration.

## What's home-manager?

[home-manager](https://github.com/nix-community/home-manager) is a project maintained by Nix's community.

It was made for managing the home directory using Nix. Combining it with NixOS makes you able to define your entire configuration with Nix.

One of it's greatest features is that it's distro agnostic, meaning that you don't have to use NixOS for it. That makes it a popular starting point for people who want to try out Nix.

## Installation

To install this config in a standalone manner, you can follow steps similiar to those for the `nixos` module:

1. Backup your old configuration:

```shell
$ mv ~/.config/home-manager ~/.config/home-manager-old
```

2. Create symlinks pointing to this directory:

```shell
$ stow -t ~/.config/home-manager .
```

3. Switch to a new configuration:

```shell
$ home-manager switch
```
