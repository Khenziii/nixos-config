# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
	../shared/shared.nix
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Shell
  programs.bash = {
    shellAliases = {
      rebuild = "rebuild-home && rebuild-system";
      rebuild-home = "mv .git .git-old && home-manager switch --flake '.#khenzii'; mv .git-old .git";
      rebuild-system = "mv .git .git-old && sudo nixos-rebuild switch --flake '.#nixos'; mv .git-old .git";
    };
  };
}
