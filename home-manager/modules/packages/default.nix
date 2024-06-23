{ ... }:

{
  imports = [
	./shell
	./development-environment
    ./wget.nix
    ./neovim.nix
	./kitty.nix
	./neofetch.nix
	./rofi.nix
	./wl-clipboard.nix
	./swww.nix
	./libnotify.nix
	./swaynotificationcenter.nix
	./pavucontrol.nix
	./networkmanagerapplet.nix
	# ./discord.nix | vesktop is being used instead. In case of
	# any issues, re-enabling this is okay.
	# ./spotify.nix | spicetify is being used instead.
	./spicetify-cli.nix
	./hyprshot.nix
	./caprine-bin.nix
    ./cava.nix	
    ./peaclock.nix	
    ./eww.nix	
    ./vesktop.nix	
    ./obs-studio.nix
    # ./steam.nix | steam is enabled system-wide, as it requires
	# opening some ports in the firewall for certain features.
    ./hyprcursor.nix
    ./nerdfonts.nix
    ./super-tux.nix
    ./super-tux-kart.nix
    ./btop.nix
    ./fzf.nix
    ./delta.nix
    ./imv.nix
    ./swaylock.nix
    ./tmux.nix
    ./mpv.nix
    ./brightnessctl.nix
	./tree.nix
	./thefuck.nix
	./ffmpeg.nix
  ];
}

