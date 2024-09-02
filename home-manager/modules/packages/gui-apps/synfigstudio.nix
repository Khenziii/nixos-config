{ pkgs, ... }:

{
  home.packages = with pkgs; [
    synfigstudio
  ];
}

