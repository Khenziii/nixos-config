{pkgs, ...}: {
	home.packages = with pkgs; [
		dmidecode
	];
}
