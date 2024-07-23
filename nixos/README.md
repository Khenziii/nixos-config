## nixos 

This directory contains my NixOS configuration.

## What's NixOS?

The NixOS project consist of 3 core parts:

1. [Nix](https://github.com/NixOS/nix) - a purely functional package manager.
2. [NixOS](https://github.com/NixOS/nixpkgs/tree/master/nixos) - a distro specifficaly made to be managed using Nix.
3. [Nixpkgs](https://github.com/NixOS/nixpkgs) - a collection of official packages that are downloaded using Nix. 

The difference between Nix and other package managers, is the fact that Nix setups are fully reproducible.

You might be wondering "How?" & the answer is actually rather simple: we store the configuration in a file! (no, really)

Instead of imperatively installing packages, we basically create a file storing a list of all the packages that we have installed.

This makes us able to just move this file to another machine, and install every single package that we've had before.

On top of that, we can also configure our system using Nix. We can for example define our hostname, or wheter bluetooth should be enabled on boot.

If you spend a lot of time configuring your machine, Nix ensures that you'll never loose your settings and that you'll be able to manage them from a single place.

*Keep in mind, that I've presented an simplified description; for more info, see the [official documentation](https://nixos.org/learn).*

## Installation

> [!NOTE]  
> You obviously need to use NixOS for this. 

If you want to install my NixOS config in a standalone manner, you can symlink files from this directory to `/etc/nixos` and rebuild your configuration. Here's how to do this:

> [!IMPORTANT]  
> If you have any existing configuration, back it up using this command:
>
> ```shell
> $ sudo mv /etc/nixos /etc/nixos-old 
> ```

```shell
$ sudo stow -t /etc/nixos .
```

After that, you can rebuild to apply the config:

```shell
$ sudo nixos-rebuild switch
```

