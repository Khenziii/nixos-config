{ ... }:

{
  imports = [
	./shell
	./development-environment
	./cli-utilities
	./kitty.nix
	./rofi.nix
	./swww.nix
	./swaynotificationcenter.nix
	./pavucontrol.nix
	./networkmanagerapplet.nix
	# ./discord.nix | vesktop is being used instead. In case of
	# any issues, re-enabling this is okay.
	# ./spotify.nix | spicetify is being used instead.
	./hyprshot.nix
	./caprine-bin.nix
    ./eww.nix	
    ./vesktop.nix	
    ./obs-studio.nix
    # ./steam.nix | steam is enabled system-wide, as it requires
	# opening some ports in the firewall for certain features.
    ./hyprcursor.nix
    ./nerdfonts.nix
    ./super-tux.nix
    ./super-tux-kart.nix
    ./swaylock.nix
    ./mpv.nix
	./nwg-displays.nix
	./firefox.nix
  ];
}

