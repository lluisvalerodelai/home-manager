{ pkgs, ...}:

{
    home.packages = with pkgs; [
	    zoxide	
	    zsh-history
    	zsh-autosuggestions
    	zsh-syntax-highlighting

    ];

    programs.zsh = {
      enable = true;

      oh-my-zsh = {
	enable = true;
	plugins = [ 
	"git"
	];
	theme = "avit";
      };

    syntaxHighlighting.enable = true;

    initExtra = ''

      eval "$(zoxide init zsh)"

      source /home/lluis/.config/zsh-nix-shell/nix-shell.plugin.zsh

      ZSH_AUTOCOMPLETE_SUGGESTIONS=1

      # Enable the case-insensitive completion
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

      # Setup alias for common commands
      alias cd='z' 
      alias ..='cd ..'
      alias ...='cd ../..'
      alias n.='nvim .'

      ZSH_THEME="robbyrussell"
      
      # Check if we are inside a nix-shell
      if [[ -n "$IN_NIX_SHELL" ]]; then
        PROMPT='[nix-shell]'$PROMPT
      fi
      '';
	};
}
