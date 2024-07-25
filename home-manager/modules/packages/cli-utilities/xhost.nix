{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xorg.xhost
  ];
}

