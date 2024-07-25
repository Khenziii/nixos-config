{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lxde.lxsession
  ];
}

