{ lib }:

{
  allPathsByDirectory = path:
	map(f: (path + "/${f}"))
		(builtins.attrNames
			(lib.attrsets.filterAttrs
				(
					name: _type:
						(_type == "directory" && builtins.pathExists (path + "/${name}/default.nix")) # include directories
						|| ( (name != "default.nix") # ignore default.nix
							&& (lib.strings.hasSuffix ".nix" name) # include .nix files
						)
				)
				(builtins.readDir path)));
  exclude = { elements, exclude }: builtins.filter (p: !(builtins.elem p exclude)) elements;
}
