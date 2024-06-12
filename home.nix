{ config, pkgs, passedArgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = passedArgs.username;
    homeDirectory = "/home/${passedArgs.username}";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { 
	  fonts = [ "Hack" ]; 
    })
  ];

  catppuccin.flavor = "mocha";
  catppuccin.accent = "mauve";
  catppuccin.enable = true;
}

