{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprcursor
  ];
}

