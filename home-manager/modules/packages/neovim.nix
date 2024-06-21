{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
	extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [ imagemagick ];
  };
}

