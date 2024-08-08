{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fontforge-gtk
  ];
}

