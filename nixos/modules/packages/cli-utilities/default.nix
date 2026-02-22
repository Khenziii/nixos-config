{ lib, ... }:
let
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
in
{
	imports = currentDirectoryPaths;
}
