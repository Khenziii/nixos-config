{pkgs, ...}: {
	home.packages = with pkgs; [
		bear
	];
}
