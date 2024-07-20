{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gedit
  ];
}

