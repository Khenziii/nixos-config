{ pkgs, ... }:

{
  home.packages = with pkgs; [
    scdl
  ];
}

