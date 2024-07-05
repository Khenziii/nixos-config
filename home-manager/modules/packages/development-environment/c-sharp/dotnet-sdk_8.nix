{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dotnet-sdk_8
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
  };
}

