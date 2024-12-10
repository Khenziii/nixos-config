{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lsof
  ];
}

