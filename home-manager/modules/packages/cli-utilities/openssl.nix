{ pkgs, ... }:

{
  home.packages = with pkgs; [
    openssl
  ];

  home.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}

