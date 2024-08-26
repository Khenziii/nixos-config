{ ... }:

{
  programs.mpv = {
    enable = true;
	catppuccin.enable = true; 
    config = {
      ao = "alsa";
      audio-device = "auto";
    };
  };
}

