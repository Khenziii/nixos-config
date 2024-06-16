{ config, pkgs, inputs, ... }:

{
  imports = [
	../shared/shared.nix
	./modules
  ];

  home.packages = with pkgs; [
    neofetch
    rofi-wayland
    wl-clipboard
    swww
    libnotify
    swaynotificationcenter
    pavucontrol
    networkmanagerapplet
    discord
    spotify
    spicetify-cli
    hyprshot
    caprine-bin
    cava
    peaclock
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

  programs.cava = {
    enable = true;
	catppuccin = {
	  enable = true;
	  transparent = true;
	};
  };

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
