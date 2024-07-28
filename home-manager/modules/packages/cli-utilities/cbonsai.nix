{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cbonsai
  ];
}

