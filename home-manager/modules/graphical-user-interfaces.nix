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
}

