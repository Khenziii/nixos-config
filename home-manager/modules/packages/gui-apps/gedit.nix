{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gedit
  ];

  # You can use `dconf watch /` to obtain these settings.
  # See: https://determinate.systems/posts/declarative-gnome-configuration-with-nixos/
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      display-line-numbers = false;
      highlight-current-line = false;
      use-default-font = false;
      editor-font = "Hack Nerd Font 18";
    };
  };
}

