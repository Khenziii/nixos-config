{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gitleaks 
  ];
}

