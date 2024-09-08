{ pkgs, ... }:

{
  home.packages = with pkgs; [
    unar
  ];
}

