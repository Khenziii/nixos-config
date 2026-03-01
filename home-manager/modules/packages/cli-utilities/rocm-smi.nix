{pkgs, ...}: {
	home.packages = with pkgs; [
		rocmPackages.rocm-smi
	];
}
