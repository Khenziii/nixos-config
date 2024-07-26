{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmatrix
  ];
}

