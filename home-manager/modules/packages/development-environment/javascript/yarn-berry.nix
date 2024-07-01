{ pkgs, ... }:

{
  home.packages = with pkgs; [
    yarn-berry 
  ];
}

