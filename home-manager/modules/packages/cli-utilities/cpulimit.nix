{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cpulimit
  ];
}

