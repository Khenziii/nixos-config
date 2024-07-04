{ inputs, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  users.users.${inputs.username} = {
    isNormalUser = true;
    description = "Khenzii";
    extraGroups = [
	  "networkmanager"
	  "wheel"
	  "docker"
	];
  };
}

