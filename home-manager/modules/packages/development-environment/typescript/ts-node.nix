{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodePackages.ts-node
  ];
}

