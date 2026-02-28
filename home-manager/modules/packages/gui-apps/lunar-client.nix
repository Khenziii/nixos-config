{pkgs, ...}: {
	home.packages = with pkgs; [
		lunar-client
	];
}
