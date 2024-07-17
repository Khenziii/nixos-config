{ pkgs, ... }: let
  soundnode = import ./soundnode.nix {
    inherit (pkgs) lib stdenv fetchurl makeWrapper gtk2 gtk3 electron atk glib cairo;
  };
in

{
  imports = [
    ./caprine-bin.nix
	# ./discord.nix | vesktop is being used instead. In case of
	# any issues, re-enabling this is okay.
	./firefox.nix
	./kitty.nix
	./mpv.nix
	./networkmanagerapplet.nix
	./nwg-displays.nix
	./obs-studio.nix
	./pavucontrol.nix
	# ./spotify.nix | spicetify is being used instead.
	# ./steam.nix | steam is enabled system-wide, as it requires
	# opening some ports in the firewall for certain features.
	./super-tux-kart.nix
	./super-tux.nix
	./vesktop.nix
	./qalculate-gtk.nix
	./godot_4.nix
	./wireshark.nix
	./vscode.nix
	./lutris.nix
	./google-chrome.nix
	./slack.nix
  ];

  home.packages = [
    # soundnode
  ];
}

