{ pkgs, ... }:

{
  home.packages = with pkgs; [
    catppuccin-cursors.mochaMauve
  ];

  home.pointerCursor = {
	name = "catppuccin-mocha-mauve-cursors";
    package = pkgs.catppuccin-cursors.mochaMauve;
    size = 24;
  };
}

