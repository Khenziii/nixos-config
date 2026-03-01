{lib, pkgs, ...}: let
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
	pathsToExcludeFromImport = [
		./steam.nix # steam is enabled system-wide, as it requires opening some ports in the firewall for certain features.
		./vesktop.nix # discord is temporarily used.
		./minecraft.nix # minecraft is temporarily marked as broken.
		./virtualbox.nix # virtualbox is enabled using NixOS' `virtualisation.virtualbox` option.
		./godot3-mono.nix # godot 4 is being used instead.
		./atlauncher.nix # lunar client is being used instead.
		./postman.nix # hoppscotch is used instead. ./netflix.nix
		./screenkey.nix # showmethekey is used instead.
		./netflix.nix
		./soundnode.nix
		./sherloq.nix
		./sowon.nix
	];
	pathsToImport =
		lib.internal.exclude {
			elements = currentDirectoryPaths;
			exclude = pathsToExcludeFromImport;
		};

	soundnode = pkgs.callPackage ./soundnode.nix {};
	sherloq = pkgs.callPackage ./sherloq.nix {};
	sowon = pkgs.callPackage ./sowon.nix {};
in {
	imports = pathsToImport;

	home.packages = [
		# soundnode
		# sherloq
		sowon
	];
}
