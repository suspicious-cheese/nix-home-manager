{ config, pkgs, ... }: {
  home.username = "chleese";
  home.homeDirectory = "/home/chleese";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    hello
    micro
    bat
    kdePackages.kmines
    yazi
  ];

  programs.yazi = {
  	enable = true;
  	enableZshIntegration = true;
  };

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

  programs.bash = {
  	enable = true;
  	bashrcExtra = ''
  	    if [ -f ~/.bashrc.local ]; then
  	      source ~/.bashrc.local
  	    fi
  	  '';

  	sessionVariables = {
  	    EDITOR = "micro";
  	    VISUAL = "micro";
  	  };

  	shellAliases = {
  		mi = "micro";
		hms = "home-manager switch --flake ~/.nix#chleese";
	    whs = "wormhole send";
	    whr = "wormhole receive";
  	};
  };

  home.sessionVariables = {
  	EDITOR = "micro";
  	VISUAL = "micro";
  };

  
  programs.home-manager.enable = true;
}
