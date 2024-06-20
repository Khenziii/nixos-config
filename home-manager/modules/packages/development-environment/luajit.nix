{ pkgs, ... }:

{
  home.packages = with pkgs; [
    luajit
  ];
}

