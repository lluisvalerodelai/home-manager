{ pkgs, ...}:

{
  
  #NixOS doesent play nice with dynamically linked binaries (by design..), so you can just hard install and then specify the path in the file inside .local where mason sources the lsp
  home.packages = [
    pkgs.lua-language-server 
  ];

  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }

      {
        plugin = nvim-web-devicons;
        config = toLua "require(\"nvim-web-devicons\").setup()";
      }

      {
        plugin = oil-nvim;
        config = toLuaFile ./plugins/oil.lua;
      }

      {
        plugin = nvim-autopairs;
        config = toLuaFile ./plugins/autopairs.lua;
      }

      telescope-ui-select-nvim
      plenary-nvim
      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugins/telescope.lua;
      }

      telescope-fzf-native-nvim

      #lsp
      cmp-nvim-lsp
      cmp_luasnip
      friendly-snippets
      luasnip
      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugins/completions.lua;
      }

      #lsp setups
      mason-nvim
      mason-lspconfig-nvim
      lsp_signature-nvim
      nvim-lspconfig
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugins/lspconfig.lua;
      }

      {
        plugin = leap-nvim;
        config = toLuaFile ./plugins/leap.lua;
      }

      {
        plugin = nvim-treesitter;
        config = toLuaFile ./plugins/treesitter.lua;
      }

    ];

  extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';

  };

}
