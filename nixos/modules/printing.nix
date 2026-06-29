{pkgs, ...}: {
	services.printing = {
		enable = true;
		drivers = with pkgs; [
			epson-escpr
			epson-escpr2
		];
	};

	# Scanners.
	hardware.sane = {
		enable = true;
		extraBackends = [ pkgs.epsonscan2 ];
	};
}
