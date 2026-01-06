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
        modules = [ ./home-linux.nix ];
      };
      
      "chleese-mac" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-darwin;
        modules = [ ./home-mac.nix ];
      };

      "chleese-mac-sil" = home-manager.lib.homeManagerConfiguration {
      	pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      	modules = [ ./home-mac-sil.nix];
      };
      "chleese-server" = hoome-manager.lib.homeManagerConfiguration {
      	pkgs = nixpkgs.legacyPackages.x86_64-linux;
      	modules = [ ./home-server.nix ];
      };
    };
  };
}
