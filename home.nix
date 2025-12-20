{ config, pkgs, ... }: {
  home.username = "chleese";
  home.homeDirectory = "/home/chleese";
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
  
  programs.home-manager.enable = true;
}
