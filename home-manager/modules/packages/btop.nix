{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
  ];

  programs.btop = {
    enable = true;
	catppuccin.enable = true; 
  };
}

