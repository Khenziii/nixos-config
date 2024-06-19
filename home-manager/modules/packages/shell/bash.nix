{ shared-config, ... }:

{
  programs.bash = {
    shellAliases = shared-config.aliases;
  }; 
}

