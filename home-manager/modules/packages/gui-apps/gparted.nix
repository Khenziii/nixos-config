{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gparted
  ];
}

