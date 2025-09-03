{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alsa-utils
  ];
}

