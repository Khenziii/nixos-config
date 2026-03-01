{pkgs, ...}: {
	home.packages = with pkgs; [
		aisleriot
	];
}
