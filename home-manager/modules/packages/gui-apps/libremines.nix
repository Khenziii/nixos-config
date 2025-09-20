{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libremines
  ];
}

