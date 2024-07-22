{
  description = "Khenzii's NixOS configuration";

  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	catppuccin.url = "github:catppuccin/nix";
	spicetify-nix = { 
	  url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
	};
	firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, spicetify-nix, firefox-addons, ... }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    # Below variables get passed to the modules.
    home-manager-inputs = {
	  inherit spicetify-nix;
	  inherit firefox-addons;
	};
	nixos-inputs = {};
	shared-inputs = {
	  hostname = "iusenixosbtw";
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
		spicetify-nix.homeManagerModules.default
		./shared/shared.nix
	    ./home-manager/home.nix	
	  ];
	  extraSpecialArgs = { inputs = shared-inputs // home-manager-inputs; };
    };
  };
}

