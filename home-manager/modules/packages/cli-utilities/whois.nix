{ pkgs, ... }:

{
  home.packages = with pkgs; [
    whois
  ];
}

