{ pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lluis";
  home.homeDirectory = "/home/lluis";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
	./kitty.nix
	./zsh.nix
	./nvim/neovim.nix
  ./git.nix
  ];

  #general ones that dont need their own files
  home.packages = with pkgs; [
    #audio & brightness servers
    pulseaudioFull 
    brightnessctl

    neofetch
    fastfetch
    # nerdfonts

    #grep
    ripgrep

    #languages
    python312
    python312Packages.pip
    rustup
    libgcc
    libcxx
    gnumake42
    gcc
    go

    #misc
    htop
    tmux
    gh
    chromium
  ];
}
