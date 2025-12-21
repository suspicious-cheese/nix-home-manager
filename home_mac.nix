{ config, pkgs, ... }: {
  home.username = "klaasvanloon";
  home.homeDirectory = "/Users/klaasvanloon";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    hello
    micro
    bat
  ];

  programs.bat = {
    enable = true;
  	config = {
  	  theme = "Catppuccin Mocha";
  	};
  };

  programs.micro = {
    enable = true;
    settings = {
  	softwrap = true;
  	colorscheme = "catppuccin-mocha";
  	};
  };


  xdg.configFile."micro/colorschemes/catppuccin-mocha.micro" = {
    source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/micro/main/themes/catppuccin-mocha.micro";
      sha256 = "sha256-pWO6m6w+5AsUXqJxTwHPG5puZ8PE+7JE7KcbXk8caDs=";
    };
  };


  programs.zsh = {
    enable = true;  	
 
    shellAliases = {
  	mi = "micro";
  	hms = "home-manager switch --flake ~/.nix#chleese_mac";
  	whs = "wormhole send";
  	whr = "wormhole receive";
    };
  };
  
  programs.home-manager.enable = true;
}
