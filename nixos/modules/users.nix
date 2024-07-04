{ inputs, pkgs, ... }:

{ 
  users.users.${inputs.username} = {
    isNormalUser = true;
    description = "Khenzii";
    extraGroups = [
	  "networkmanager"
	  "wheel"
	  "docker"
	];
    shell = pkgs.zsh; 
  };
}

