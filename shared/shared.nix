{ config, pkgs, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  nixpkgs.config.allowUnfree = true;
}

