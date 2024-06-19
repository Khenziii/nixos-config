{ shared-config, ... }:

{
  home.packages = with pkgs; [
    zsh 
  ];

  programs.zsh = {
    enable = true;
	syntaxHighlighting.catppuccin.enable = true;
	shellAliases = shared-config.aliases;
  };
}

