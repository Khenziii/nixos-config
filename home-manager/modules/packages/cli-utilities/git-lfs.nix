{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git-lfs
  ];
}

