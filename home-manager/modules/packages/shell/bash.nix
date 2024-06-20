{ shared-config, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = shared-config.aliases;
  }; 
}

