{ pkgs, ... }:

{
  home.packages = with pkgs; [
    websocat
  ];
}

