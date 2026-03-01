{pkgs, ...}: {
	environment.systemPackages = with pkgs; [
		kdePackages.konsole
	];
}
