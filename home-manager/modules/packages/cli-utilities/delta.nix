{pkgs, ...}: {
	home.packages = with pkgs; [
		delta
	];

	programs.git.delta = {
		enable = true;
	};
}
