{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gradle 
  ];
}

