{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ani-cli
  ];
}

