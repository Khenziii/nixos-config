{pkgs, ...}: {
	home.packages = with pkgs; [
		btop
	];

	programs.btop = {
		enable = true;
	};
}
