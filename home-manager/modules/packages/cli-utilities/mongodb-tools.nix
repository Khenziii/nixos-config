{pkgs, ...}: {
	home.packages = with pkgs; [
		mongodb-tools
	];
}
