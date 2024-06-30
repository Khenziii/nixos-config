{ pkgs, ... }:

{
  home.packages = with pkgs; [
    node 
  ];
}

