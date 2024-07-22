{ pkgs, ... }: let
  soundnode = pkgs.callPackage ./soundnode.nix {};
  sherloq = pkgs.callPackage ./sherloq.nix {};
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
	./gedit.nix
	# ./minecraft.nix | minecraft is temporarily marked as broken. 
	./gimp.nix
	./gparted.nix
	./virtualbox.nix
  ];

  home.packages = [
    # soundnode
    # sherloq
  ];
}

