{ pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
  ];
}

