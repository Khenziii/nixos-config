{ pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux
  ];

  programs.tmux = {
    enable = true;
	catppuccin.enable = true;
  };
}

