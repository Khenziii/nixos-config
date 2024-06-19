{ config, pkgs, inputs, ... }:

{
  imports = [
	../shared/shared.nix
	./modules
  ];

  home.packages = with pkgs; [
	zsh
	brightnessctl
  ];


  programs.zsh = {
    enable = true;
	syntaxHighlighting.catppuccin.enable = true;
  };
}

