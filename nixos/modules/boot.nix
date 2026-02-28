{config, ...}: {
	# Allows broadcasting to the virtual camera in OBS studio.
	# See: https://wiki.nixos.org/wiki/OBS_Studio#Using_the_Virtual_Camera
	boot = {
		extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
		kernelModules = ["v4l2loopback"];
		extraModprobeConfig = ''
			options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
		'';
	};

	boot.loader = {
		efi.canTouchEfiVariables = true;
		grub = {
			enable = true;
			device = "nodev";
			useOSProber = true;
			efiSupport = true;
		};
	};
}
