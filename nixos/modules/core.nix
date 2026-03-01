{
	inputs,
	lib,
	...
}: {
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];

	# This probably shouldn't be changed. Please,
	# read the wiki before modifying this.
	system.stateVersion = "23.11";

	# Create a 8GB swap file
	swapDevices =
		if inputs.stationType == "laptop"
		then [
			{
				device = "/swapfile";
				size = 1024 * 8;
			}
		]
		else [
			{
				device = "/swapfile";
				size = 1024 * 2;
			}
		];
	boot.kernel.sysctl = {
		"vm.swappiness" =
			if inputs.stationType == "laptop"
			then 80
			else 20;
		"kernel.core_uses_pid" = 0;
		"kernel.core_pattern" = "./core";
	};

	# Allow access to all hidraw devices. This is necessary for
	# keyboard configuration via apps such as VIA. See:
	# https://bbs.archlinux.org/viewtopic.php?id=285709
	services.udev.extraRules = ''
		SUBSYSTEM=="hidraw", MODE="0660", GROUP="input"
	'';

	hardware.graphics.enable = lib.mkIf (inputs.stationType == "desktop") true;
	hardware.amdgpu.initrd.enable = lib.mkIf (inputs.stationType == "desktop") true;
}
