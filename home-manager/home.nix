{ config, pkgs, inputs, ... }:

{
  imports = [
	../shared/shared.nix
  ];

  home = {
    username = inputs.username;
    homeDirectory = "/home/${inputs.username}";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    wget
    git
    stow
    neovim
    kitty
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
  ];

  catppuccin = {
    flavor = "mocha";
	accent = "mauve";
  };

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

  gtk = {
    enable = true;
	catppuccin = {
	  enable = true;
	  cursor.enable = true;
	  icon.enable = true;
	};
  };
}

