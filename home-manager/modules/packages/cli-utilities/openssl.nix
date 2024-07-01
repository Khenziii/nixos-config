{ pkgs, ... }:

{
  home.packages = with pkgs; [
    openssl
  ];
}

