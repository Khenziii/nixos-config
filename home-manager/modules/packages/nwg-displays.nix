{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nwg-displays
  ];
}

