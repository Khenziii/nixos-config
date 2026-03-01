{lib, ...}: let
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
	pathsToExcludeFromImport = [
		./lua-language-server.nix # every LSP is now managed through nvim config.
	];
	pathsToImport =
		lib.internal.exclude {
			elements = currentDirectoryPaths;
			exclude = pathsToExcludeFromImport;
		};
in {
	imports = pathsToImport;
}
