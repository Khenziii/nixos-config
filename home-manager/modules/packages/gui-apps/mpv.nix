{...}: {
	programs.mpv = {
		enable = true;
		config = {
			ao = "alsa";
			audio-device = "auto";
		};
	};
}
