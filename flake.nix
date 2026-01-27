{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations = {
      "chleese-linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
        	./home.nix
			{ 
				home.username = "chleese";
				home.homeDirectory = "/home/chleese";
			}
        ];
      };
      
      "chleese-mac" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        modules = [
        	./home.nix
			{
				home.username = "klaasvanloon";
				home.homeDirectory = "/Users/klaasvanloon";
			}
        ];
      };

      "chleese-mac-sil" = home-manager.lib.homeManagerConfiguration {
      	pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      	modules = [ ./home-mac-sil.nix];
      };
      "chleese-server" = home-manager.lib.homeManagerConfiguration {
      	pkgs = nixpkgs.legacyPackages.x86_64-linux;
      	modules = [ ./home-server.nix ];
      };
    };
  };
}
