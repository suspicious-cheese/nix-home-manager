Please add (when not using zsh yet) /home/your-username/.nix-profile/bin/zsh to /etc/shells and run "chsh -s $(which zsh)"


add "experimental-features = nix-command flakes" to .config/nix/nix.conf (this directory may need to be created)
then run the following command, and if it fails check in flake.nix if a configuration is available for your system
nix run home-manager/master -- switch --flake .#chleese-platform
