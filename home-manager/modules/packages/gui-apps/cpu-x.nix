{pkgs, ...}: {
	home.packages = with pkgs; [
		cpu-x
	];
}
