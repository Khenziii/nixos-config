{ pkgs, ... }: let
  soundnode = pkgs.callPackage ./soundnode.nix {};
  sherloq = pkgs.callPackage ./sherloq.nix {};
  sowon = pkgs.callPackage ./sowon.nix {};
in

{
  imports = [
    ./caprine-bin.nix
	./discord.nix
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
	# ./vesktop.nix | discord is temporarily used.
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
    # ./virtualbox.nix | virtualbox is enabled using NixOS'
    # `virtualisation.virtualbox` option.
	./whatsapp-for-linux.nix
	./tor-browser.nix
	./protonvpn-gui.nix
	./element-desktop.nix
	./kdenlive.nix
	./fontforge-gtk.nix
	./clocks.nix
	./synfigstudio.nix
	./libreoffice.nix
	./thunar.nix
	# ./godot3-mono.nix | godot 4 is being used instead.
	# ./atlauncher.nix | lunar client is being used instead.
	./lunar-client.nix
	./via.nix
	# ./ciscopackettracer8.nix | broken.
    # ./postman.nix | hoppscotch is used instead.
	./hoppscotch.nix
	./remmina.nix
	./epiphany.nix
	./mnta.nix
  ];

  home.packages = [
    # soundnode
    # sherloq
    sowon
  ];
}

