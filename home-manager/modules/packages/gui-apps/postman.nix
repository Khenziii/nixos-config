{ pkgs, ... }:

{
  home.packages = with pkgs; [
    postman
  ];
}

