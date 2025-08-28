{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome-clocks
  ];
}

