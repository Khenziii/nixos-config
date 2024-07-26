{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cava
  ];

  programs.cava = {
    enable = true;
	catppuccin = {
	  enable = true;
	  transparent = true;
	};
  };
}

