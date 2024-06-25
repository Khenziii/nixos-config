{ pkgs, ... }:

{
  home.packages = with pkgs; [
    imgcat 
  ];
}

