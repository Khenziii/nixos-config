{ pkgs, ... }:

{
  home.packages = with pkgs; [
    github-linguist
  ];
}

