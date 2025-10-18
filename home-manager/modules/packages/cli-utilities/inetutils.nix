{ pkgs, ... }:

{
  home.packages = with pkgs; [
    inetutils
  ];
}

