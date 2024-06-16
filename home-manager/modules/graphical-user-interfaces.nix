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
	  cursor.enable = true;
	  icon.enable = true;
	};
  };
}

