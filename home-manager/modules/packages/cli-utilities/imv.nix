{pkgs, ...}: {
	home.packages = with pkgs; [
		imv
	];

	programs.imv = {
		enable = true;
	};
}
