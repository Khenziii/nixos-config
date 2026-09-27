{lib, ...}: let
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
	pathsToExcludeFromImport = [
		./rustup.nix # We're now installing rust-analyzer and cargo separately.
	];
	pathsToImport =
		lib.internal.exclude {
			elements = currentDirectoryPaths;
			exclude = pathsToExcludeFromImport;
		};
in {
	imports = pathsToImport;
}
