{lib, ...}: let 
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
in {
	imports = [./packages] ++ currentDirectoryPaths;
}
