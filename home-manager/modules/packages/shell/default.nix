{ pkgs, inputs, ... }: let
  shared-config = {
    aliases = {
      rebuild = "rebuild-system && rebuild-home";
      rebuild-home = "home-manager switch --flake '.#${inputs.username}' -b backup";
      rebuild-system = "sudo nixos-rebuild switch --flake '.#${inputs.hostname}' --impure";
	  trewa = "tree";
	  fuck = "thefuck";
	  bruh = "thefuck";
	  ripgrep = "rg";
      history = "history 1"; # show the whole history
      is-alias = "type";
      # If the bar will ever become unresponsive, you can use this command to restart it.
      fix-eww = "pkill eww && eww daemon && eww open bar";
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

