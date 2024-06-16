{ config, pkgs, inputs, ... }:

{
  imports = [
	../shared/shared.nix
	./modules
  ];

  home.packages = with pkgs; [
    eww
    vesktop
    obs-studio
    steam
    hyprcursor
    (nerdfonts.override { 
      fonts = [ "Hack" ]; 
    })
	superTux
	superTuxKart
	btop
	fzf
	delta
	imv
	swaylock
	tmux
	mpv
	zsh
	brightnessctl
  ];

  programs.btop = {
    enable = true;
	catppuccin.enable = true; 
  };

  programs.fzf = {
    enable = true;
	catppuccin.enable = true;
  };

  programs.git.delta = {
    enable = true;
	catppuccin.enable = true;
  };

  programs.imv = {
    enable = true;
	catppuccin.enable = true;
  };

  programs.swaylock = {
    enable = true;
	catppuccin.enable = true;
  };

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

