{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.breeze
  ];
}

