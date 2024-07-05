{ pkgs, ... }:

{
  home.packages = with pkgs; [
    luaformatter
  ];
}

