{ config, pkgs, ... }: {
  home.username = "klaas";
  home.homeDirectory = "/Users/klaas";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    hello
    micro
    bat
    yazi
    btop
    neofetch
    delta
    w3m
  ];

  programs.yazi = {
    enable = true;
  	enableZshIntegration = true;

  	settings  = {
  	  preview = {
  		wrap = "yes";
  		};
  	  };
  	};

  programs.bat = {
  	enable = true;
  	config = {
  		theme = "Catppuccin Mocha";
  	};
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

    sessionVariables = {
    	EDITOR = "micro";
    	VISUAL = "micro";
    };
 
    shellAliases = {
  	mi = "micro";
  	hms = "home-manager switch --flake ~/.nix#chleese-mac-sil";
  	whs = "wormhole send";
  	whr = "wormhole receive";
  	la = "ls -aG";
  	la = "ls -a --color=auto";
  	w2m = "w3m duckduckgo.com";
    };

	oh-my-zsh = {
		enable = true;
		theme = "af-magic";
	};
    
  };


  programs.btop = {
  	enable = true;
  	settings = {
  		color_theme = "catppuccin-mocha";
  	};
  	themes = {
  	  		catppuccin-mocha = ''
  	  		# Main background, empty for terminal default, need to be empty if you want transparent background
  	  		theme[main_bg]="#1e1e2e"
  	  		
  	  		# Main text color
  	  		theme[main_fg]="#cdd6f4"
  	  		
  	  		# Title color for boxes
  	  		theme[title]="#cdd6f4"
  	  		
  	  		# Highlight color for keyboard shortcuts
  	  		theme[hi_fg]="#89b4fa"
  	  		
  	  		# Background color of selected item in processes box
  	  		theme[selected_bg]="#45475a"
  	  		
  	  		# Foreground color of selected item in processes box
  	  		theme[selected_fg]="#89b4fa"
  	  		
  	  		# Color of inactive/disabled text
  	  		theme[inactive_fg]="#7f849c"
  	  		
  	  		# Color of text appearing on top of graphs, i.e uptime and current network graph scaling
  	  		theme[graph_text]="#f5e0dc"
  	  		
  	  		# Background color of the percentage meters
  	  		theme[meter_bg]="#45475a"
  	  		
  	  		# Misc colors for processes box including mini cpu graphs, details memory graph and details status text
  	  		theme[proc_misc]="#f5e0dc"
  	  		
  	  		# CPU, Memory, Network, Proc box outline colors
  	  		theme[cpu_box]="#cba6f7" #Mauve
  	  		theme[mem_box]="#a6e3a1" #Green
  	  		theme[net_box]="#eba0ac" #Maroon
  	  		theme[proc_box]="#89b4fa" #Blue
  	  		
  	  		# Box divider line and small boxes line color
  	  		theme[div_line]="#6c7086"
  	  		
  	  		# Temperature graph color (Green -> Yellow -> Red)
  	  		theme[temp_start]="#a6e3a1"
  	  		theme[temp_mid]="#f9e2af"
  	  		theme[temp_end]="#f38ba8"
  	  		
  	  		# CPU graph colors (Teal -> Lavender)
  	  		theme[cpu_start]="#94e2d5"
  	  		theme[cpu_mid]="#74c7ec"
  	  		theme[cpu_end]="#b4befe"
  	  		
  	  		# Mem/Disk free meter (Mauve -> Lavender -> Blue)
  	  		theme[free_start]="#cba6f7"
  	  		theme[free_mid]="#b4befe"
  	  		theme[free_end]="#89b4fa"
  	  		
  	  		# Mem/Disk cached meter (Sapphire -> Lavender)
  	  		theme[cached_start]="#74c7ec"
  	  		theme[cached_mid]="#89b4fa"
  	  		theme[cached_end]="#b4befe"
  	  		
  	  		# Mem/Disk available meter (Peach -> Red)
  	  		theme[available_start]="#fab387"
  	  		theme[available_mid]="#eba0ac"
  	  		theme[available_end]="#f38ba8"
  	  		
  	  		# Mem/Disk used meter (Green -> Sky)
  	  		theme[used_start]="#a6e3a1"
  	  		theme[used_mid]="#94e2d5"
  	  		theme[used_end]="#89dceb"
  	  		
  	  		# Download graph colors (Peach -> Red)
  	  		theme[download_start]="#fab387"
  	  		theme[download_mid]="#eba0ac"
  	  		theme[download_end]="#f38ba8"
  	  		
  	  		# Upload graph colors (Green -> Sky)
  	  		theme[upload_start]="#a6e3a1"
  	  		theme[upload_mid]="#94e2d5"
  	  		theme[upload_end]="#89dceb"
  	  		
  	  		# Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
  	  		theme[process_start]="#74c7ec"
  	  		theme[process_mid]="#b4befe"
  	  		theme[process_end]="#cba6f7"
  	  	'';
  	  	};
  };

  xdg.configFile."yazi/theme.toml".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/yazi/main/themes/mocha/catppuccin-mocha-blue.toml";
    sha256 = "sha256-g6tFCzjd97Y3TpDYgP5OPwqkHIqzxk9JHAPfe7ffVec=";
  };

  
  programs.home-manager.enable = true;
}
