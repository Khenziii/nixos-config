{
  description = "Khenzii's NixOS configuration";

  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

	# This variable gets passed to all the modules.
	modules-inputs = {
	  hostname = "nixos";
      username = "khenzii";
	};
  in {
    nixosConfigurations.${modules-inputs.hostname} = nixpkgs.lib.nixosSystem {
	  system = system;
      modules = [
	    home-manager.nixosModules.home-manager
		catppuccin.nixosModules.catppuccin
		./shared/shared.nix
	    ./nixos/configuration.nix
	  ];
	  specialArgs = { inputs = modules-inputs; };
    };

    homeConfigurations.${modules-inputs.username} = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages.${system};
      modules = [
		catppuccin.homeManagerModules.catppuccin
		./shared/shared.nix
	    ./home-manager/home.nix	
	  ];
	  extraSpecialArgs = { inputs = modules-inputs; };
    };
  };
}

