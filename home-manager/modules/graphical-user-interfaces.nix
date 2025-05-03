{ ... }:

{
  qt.style.catppuccin = {
    enable = true;
	apply = true; # auto applies the theme
  };

  gtk = {
    enable = true;
	catppuccin = {
	  enable = true;
	  icon.enable = true;
	};
  };

  catppuccin.pointerCursor.enable = true;

  fonts.fontconfig.enable = true;

  xdg.desktopEntries = {
    firefox = {
      name = "FireFox";
      genericName = "Web Browser 🦊";
      exec = "firefox --name firefox %U";
      icon = "firefox";
    };
  };
}

