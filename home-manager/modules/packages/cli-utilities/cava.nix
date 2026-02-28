{pkgs, ...}: {
	home.packages = with pkgs; [
		cava
	];

	programs.cava = {
		enable = true;
	};
}
