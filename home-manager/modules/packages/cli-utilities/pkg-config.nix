{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkg-config
  ];
}

