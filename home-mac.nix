{ config, pkgs, ... }: {
  home.username = "klaasvanloon";
  home.homeDirectory = "/Users/klaasvanloon";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    hello
    micro
    bat
    yazi
  ];

  programs.yazi = {
    enable = true;
  	enableZshIntegration = true;
  	};

  home.sessionVariables = {
    EDITOR = "micro";
    VISUAL = "micro";
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

  xdg.configFile."yazi/theme.toml".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/yazi/main/themes/mocha/catppuccin-mocha-blue.toml";
    sha256 = "sha256-g6tFCzjd97Y3TpDYgP5OPwqkHIqzxk9JHAPfe7ffVec=";
  };

  
  programs.home-manager.enable = true;
}
