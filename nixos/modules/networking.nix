{inputs, ...}: {
	services.logmein-hamachi.enable = true;
	networking.hostName = inputs.hostname;
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	networking.firewall = {
		enable = true;
		allowedTCPPorts = [8080 8000 3979 25565];
		allowedUDPPorts = [
			34197 # Factorio.
			3979 # OpenTTD.
			25565 # Minecraft.
		];
		trustedInterfaces = [ "ham0" ]; # TODO: do I need this???
		checkReversePath = "loose";
	};
}
