{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    stow
  ];
}

