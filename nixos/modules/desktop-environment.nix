{ pkgs, ... }:

{
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

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        # Remaps right control to the super key.
        # This is useful on some laptops, where
        # there is no right-side super.
        rightcontrol = "rightmeta";
      };
    };
  };

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

