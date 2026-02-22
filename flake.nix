{
  description = "Khenzii's NixOS configuration";

  inputs = { 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = { 
      url = "github:nix-community/home-manager/release-25.05";
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
    vms.url = "github:matthewcroughan/nixtheplanet";
    mnta.url = "github:khenziii/mnta";
  };

  outputs = { 
    nixpkgs,
    home-manager,
    catppuccin,
    spicetify-nix,
    firefox-addons,
    vms,
    mnta,
    ...
  }: let 
    # Below variables get passed to the modules.
    home-manager-inputs = {
	  inherit spicetify-nix;
	  inherit firefox-addons;
	  inherit mnta;
	};
	nixos-inputs = {};
	shared-inputs = {
	  hostname = "iusenixosbtw";
      username = "khenzii";
      system = "x86_64-linux";
      stationType = builtins.getEnv "KHENZII_STATION_TYPE";
	};
	home-manager-args = {
		inputs = shared-inputs // home-manager-inputs;
	};
	nixos-args = {
		inputs = shared-inputs // nixos-inputs;
	};
	shared-args = {
		lib = nixpkgs.lib.extend (final: prev:
			{ internal = import ./shared/lib { lib = final; }; } // home-manager.lib
		);
	};
  in {
    nixosConfigurations.${shared-inputs.hostname} = nixpkgs.lib.nixosSystem {
	  system = shared-inputs.system;
      modules = [
	    home-manager.nixosModules.home-manager
		catppuccin.nixosModules.catppuccin
        vms.nixosModules.macos-ventura
		./shared/shared.nix
	    ./nixos/configuration.nix
	  ];
	  specialArgs = shared-args // nixos-args;
    };

    homeConfigurations.${shared-inputs.username} = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages.${shared-inputs.system};
      modules = [
		catppuccin.homeModules.catppuccin
		spicetify-nix.homeManagerModules.default
		./shared/shared.nix
	    ./home-manager/home.nix	
	  ];
	  extraSpecialArgs = shared-args // home-manager-args;
    };
  };
}

