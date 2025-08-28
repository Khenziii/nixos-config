{ ... }: 

{
  imports = [
    ./core.nix
	./systemd.nix
	./catppuccin.nix
	./graphical-user-interfaces.nix
	# ./spicetify.nix | vanilla `spotify` is temporarily used instead.
	./packages
  ];
}

