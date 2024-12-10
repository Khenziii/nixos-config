{ shared-config, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = shared-config.aliases;
    bashrcExtra = shared-config.init-extra;
  }; 
}

