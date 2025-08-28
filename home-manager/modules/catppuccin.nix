{ ... }:

{
  # catppuccin is not enabled globally,
  # because some of my dotfiles are
  # conflicting with all the available themes.
  catppuccin = {
    flavor = "mocha";
	accent = "mauve";
    kvantum = {
        enable = true;
        apply = true;
    };
    cava = {
        transparent = true;
        enable = true;
    };
    tmux.enable = true;
    swaylock.enable = true;
    mpv.enable = true;
    imv.enable = true;
    fzf.enable = true;
    delta.enable = true;
    cursors.enable = true;
    btop.enable = true;
    zsh-syntax-highlighting.enable = true;
  };
}

