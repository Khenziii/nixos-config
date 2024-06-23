{
  description = "Khenzii's NixOS configuration";

  inputs = { 
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/e8057b67ebf307f01bdcc8fba94d94f75039d1f6";
    home-manager = { 
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/a7117efb3725e6197dd95424136f79147aa35e5b";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	catppuccin.url = "github:catppuccin/nix";
	spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, spicetify-nix, ... }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    # Below variables get passed to the modules.
    home-manager-inputs = {
	  inherit spicetify-nix;
	};
	nixos-inputs = {};
	shared-inputs = {
	  hostname = "nixos";
      username = "khenzii";
	};
  in {
    nixosConfigurations.${shared-inputs.hostname} = nixpkgs.lib.nixosSystem {
	  system = system;
      modules = [
	    home-manager.nixosModules.home-manager
		catppuccin.nixosModules.catppuccin
		./shared/shared.nix
	    ./nixos/configuration.nix
	  ];
	  specialArgs = { inputs = shared-inputs // nixos-inputs; };
    };

    homeConfigurations.${shared-inputs.username} = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages.${system};
      modules = [
		catppuccin.homeManagerModules.catppuccin
		spicetify-nix.homeManagerModule
		./shared/shared.nix
	    ./home-manager/home.nix	
	  ];
	  extraSpecialArgs = { inputs = shared-inputs // home-manager-inputs; };
    };
  };
}

