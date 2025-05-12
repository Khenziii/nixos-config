{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cmake
  ];
}

