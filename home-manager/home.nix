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
	alacritty
  ];

  programs.alacritty = {
    enable = true;
    catppuccin = {
	  enable = true;
	  flavor = "latte";
	};
  };
}

