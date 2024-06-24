{ pkgs, ... }:

{
  home.packages = with pkgs; [
    caprine-bin 
  ];
}

