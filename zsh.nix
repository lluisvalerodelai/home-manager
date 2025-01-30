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

      ZSH_AUTOCOMPLETE_SUGGESTIONS=1

      # Enable the case-insensitive completion
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

      # Setup alias for common commands
      alias cd='z' 
      alias ..='cd ..'
      alias ...='cd ../..'
      alias n.='nvim .'
      alias gcm='git commit -m'
      alias ga.='git add .'
      alias gs='git status'
      alias gd='git diff'
      alias gl='git log --oneline --graph --decorate'

      # Show git branch in prompt
      # PROMPT='%F{yellow}%n%f@%F{green}%1~%f %# '
      '';
	};
}
