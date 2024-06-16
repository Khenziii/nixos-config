{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swww
  ];
}

