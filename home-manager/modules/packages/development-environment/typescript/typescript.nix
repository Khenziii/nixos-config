{ pkgs, ... }:

{
  home.packages = with pkgs; [
    typescript
  ];
}

