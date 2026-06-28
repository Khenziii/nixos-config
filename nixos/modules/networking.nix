{inputs, ...}: {
	services.logmein-hamachi.enable = true;

	networking.hostName = inputs.hostname;

	networking.networkmanager.enable = true;

	networking.firewall = {
		enable = true;
		allowedTCPPorts = [8080 8000 3979 25565];
		allowedUDPPorts = [
			34197 # Factorio.
			3979 # OpenTTD.
			25565 # Minecraft.
		];
		# Helps with some connectivity issues when hosting a server behind hamachi.
		trustedInterfaces = [ "ham0" ];
		checkReversePath = "loose";
	};

	# Automatic discovery of devices on the network.
	services.avahi = {
		enable = true;
		nssmdns4 = true;
		openFirewall = true;
	};
}
