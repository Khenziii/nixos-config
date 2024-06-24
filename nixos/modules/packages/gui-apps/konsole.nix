{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    konsole 
  ];
}

