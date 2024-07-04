{ ... }:

{
  imports = [
    ./bluetooth.nix
	./bootloader.nix
	./catppuccin.nix
	./core.nix
	./desktop-environment.nix
	./location.nix
	./networking.nix
	./printing.nix
	./sound.nix
    ./users.nix
    ./shell.nix
	./packages
  ];
}

