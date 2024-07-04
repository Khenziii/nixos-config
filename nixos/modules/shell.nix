{ ... }:

{
  # shells should be enabled system wide, even
  # if they're managed by home-manager, in order
  # to grant them necessary context. See:
  # https://nixos.wiki/wiki/Command_Shell
  programs.zsh.enable = true;
}

