{pkgs, ...}: {
	home.packages = with pkgs; [
		openttd
	];
}
