{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    os-prober
  ];
}

