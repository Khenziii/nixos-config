{ config, pkgs, inputs, ... }:

{
  imports = [
	../shared/shared.nix
	./modules
  ];

  home.packages = with pkgs; [
	tmux
	mpv
	zsh
	brightnessctl
  ];

  programs.tmux = {
    enable = true;
	catppuccin.enable = true;
  };

  programs.mpv = {
    enable = true;
	catppuccin.enable = true; 
  };

  programs.zsh = {
    enable = true;
	syntaxHighlighting.catppuccin.enable = true;
  };
}

