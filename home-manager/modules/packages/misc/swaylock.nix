{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swaylock
  ];

  programs.swaylock = {
    enable = true;
  };
}

