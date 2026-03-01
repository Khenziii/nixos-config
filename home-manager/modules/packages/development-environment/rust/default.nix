{lib, ...}: let
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
	pathsToExcludeFromImport = [
		./cargo.nix # `rustup` also provides the `cargo` binary.
	];
	pathsToImport =
		lib.internal.exclude {
			elements = currentDirectoryPaths;
			exclude = pathsToExcludeFromImport;
		};
in {
	imports = pathsToImport;
}
