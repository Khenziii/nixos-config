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
	passedArgs = {
	  hostname = "nixos";
      username = "khenzii";
	  catppuccin = catppuccin;
	};
  in {
    nixosConfigurations.${passedArgs.hostname} = nixpkgs.lib.nixosSystem {
	  system = system;
      modules = [
	    ./configuration.nix
	  ];
	  specialArgs = { passedArgs = passedArgs; };
    };

    homeConfigurations.${passedArgs.username} = home-manager.lib.homeManagerConfiguration {
	  pkgs = pkgs;
      modules = [
	    ./home.nix
	  ];
	  extraSpecialArgs = { passedArgs = passedArgs; };
    };
  };
}

