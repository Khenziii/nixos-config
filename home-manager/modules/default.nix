{ ... }: 

{
  imports = [
    ./core.nix
	./cursor.nix
	./systemd.nix
	./catppuccin.nix
	./graphical-user-interfaces.nix
	./packages
  ];
}

