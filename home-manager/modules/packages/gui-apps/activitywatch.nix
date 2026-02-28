{pkgs, ...}: {
	home.packages = with pkgs; [
		activitywatch
	];
}
