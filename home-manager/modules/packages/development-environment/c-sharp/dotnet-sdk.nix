{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dotnet-sdk
  ];
}

