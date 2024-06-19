{ ... }:

{
  # Explicitly enable touchpad support (most desktop 
  # environments (hyprland included) support this by default).
  # services.xserver.libinput.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = false;
  programs.hyprland = {
    enable = true;
	xwayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}

