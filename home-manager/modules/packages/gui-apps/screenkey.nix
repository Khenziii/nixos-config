{ pkgs, ... }:

{
  home.packages = with pkgs; [
    screenkey
  ];
}

