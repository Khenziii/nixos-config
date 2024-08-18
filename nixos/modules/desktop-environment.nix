{ pkgs, ... }:

{
  # Explicitly enable touchpad support (most desktop 
  # environments (hyprland included) support this by default).
  # services.xserver.libinput.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
	package = pkgs.kdePackages.sddm;
  };
  programs.hyprland = {
    enable = true;
	xwayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "pl";

  # Wayland doesn't provide a scren sharing API by default.
  # According to theirs philosophy, the desktop environment
  # should implement this. Thus the portals.
  xdg.portal = {
    enable = true;
	extraPortals = with pkgs; [ 
      xdg-desktop-portal-hyprland 
	];
  };

  security.polkit.enable = true;

  programs.dconf.enable = true;
}

