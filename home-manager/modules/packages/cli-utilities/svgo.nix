{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodePackages.svgo
  ];
}

