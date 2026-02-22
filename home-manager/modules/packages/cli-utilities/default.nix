{ pkgs, lib, ... }: let
	currentDirectoryPaths = lib.internal.allPathsByDirectory ./.;
	pathsToExcludeFromImport = [ ./guess-the-number-asm.nix ];
	pathsToImport = lib.internal.exclude { elements = currentDirectoryPaths; exclude = pathsToExcludeFromImport; };

    guess-the-number-asm = pkgs.callPackage ./guess-the-number-asm.nix {};
in 

{
  imports = pathsToImport;

  home.packages = [
    guess-the-number-asm
  ];
}

