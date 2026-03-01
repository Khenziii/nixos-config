{pkgs, ...}: {
	home.packages = with pkgs; [
		godot3-mono
	];
}
