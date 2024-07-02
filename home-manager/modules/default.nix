{ ... }: 

{
  imports = [
    ./core.nix
	./systemd.nix
	./catppuccin.nix
	./graphical-user-interfaces.nix
	# ./spicetify.nix | after a recent update, I have started
    # having issues with this flake. For now, I'm going to use
    # the official client.
	./packages
  ];
}

