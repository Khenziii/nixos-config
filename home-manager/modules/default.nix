{lib, ...}: let
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
	pathsToExcludeFromImport = [
		./spicetify.nix # vanilla `spotify` is temporarily used instead.
	];
	pathsToImport =
		lib.internal.exclude {
			elements = currentDirectoryPaths;
			exclude = pathsToExcludeFromImport;
		};
in {
	imports = pathsToImport;
}
