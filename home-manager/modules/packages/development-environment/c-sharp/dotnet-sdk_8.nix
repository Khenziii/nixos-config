{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dotnet-sdk_8
  ];
}

