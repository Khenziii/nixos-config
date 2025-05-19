{ pkgs, ... }:

{
  home.packages = with pkgs; [
    epiphany
  ];
}

