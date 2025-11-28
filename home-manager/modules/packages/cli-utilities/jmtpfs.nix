{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jmtpfs
  ];
}

