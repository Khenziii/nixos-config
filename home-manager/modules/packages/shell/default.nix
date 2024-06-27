{ pkgs, inputs, ... }: let
  shared-config = {
    aliases = {
      rebuild = "rebuild-system && rebuild-home";
      rebuild-home = "mv .git .git-old && home-manager switch --flake '.#${inputs.username}'; mv .git-old .git";
      rebuild-system = "mv .git .git-old && sudo nixos-rebuild switch --flake '.#${inputs.hostname}'; mv .git-old .git";
	  trewa = "tree";
	  fuck = "thefuck";
	  bruh = "thefuck";
	  ripgrep = "rg";
	};
  };
  
  zsh-config = import ./zsh.nix { inherit shared-config; inherit pkgs; };
  bash-config = import ./bash.nix { inherit shared-config; };
in 

{
  imports = [
    zsh-config
    bash-config
  ];
}

