{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua54Packages.luarocks
  ];
}

