{ pkgs, ... }:

{
  home.packages = with pkgs; [
    peaclock
  ];
}

