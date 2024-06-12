{
  description = "Khenzii's NixOS configuration";

  inputs = { 
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

	# This variable gets passed to all the modules.
	passedArgs = {
	  hostname = "nixos";
      username = "khenzii";
	};
  in {
    nixosConfigurations.${passedArgs.hostname} = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
	  specialArgs = { passedArgs = passedArgs; };
    };

    homeConfigurations.${passedArgs.username} = home-manager.libs.homeManagerConfiguration {
      modules = [ ./home.nix ];
	  specialArgs = { passedArgs = passedArgs; };
    };
  };
}

