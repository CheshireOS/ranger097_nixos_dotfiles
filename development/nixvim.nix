{ config, pkgs, lib, ... }:{
 
    programs.neovim = {
    enable = true;
     plugins = with pkgs; [
     vimPlugins.nvim-treesitter.withAllGrammars
    ];
    };




    programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.gruvbox.enable = false;
        
    plugins.treesitter = {
    enable = true;
    settings.highlight.enable = true;
    settings.indent.enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    javascript
    typescript
    tsx
    svelte
    html
    css
    go
    python
    rust
    java
    gdscript
    nix
    kotlin
    ];
    };
    plugins.web-devicons.enable = true;    
    plugins.telescope.enable = true; 
    plugins.lualine.enable = true;
    plugins.luasnip.enable = true;
    plugins.rustaceanvim.enable = true;
    plugins.lsp.enable = true;
    plugins.java.enable = true;
    plugins.auto-save.enable = true;
    plugins.dotnet.enable = true;
    plugins.fzf-lua.enable = true;
    plugins.git-conflict.enable = true;
    plugins.git-worktree.enable = true;
    plugins.git-worktree.enableTelescope = true;
    plugins.godot.enable = true;
    plugins.harpoon.enable = true;
    plugins.harpoon.enableTelescope = true;
    plugins.harpoon.autoLoad = true;
    plugins.cmp = {
      enable = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    
       mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };

        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
    };   
    opts = {
      number = true;         
      relativenumber = true; 
      shiftwidth = 2;   
      termguicolors = true;
    };
    
    highlight = {
      Normal.bg = "none";
      NonText.bg = "none";
      NormalFloat.bg = "none";
      SignColumn.bg = "none";
      StatusLine.bg = "none";
      VertSplit.bg = "none";
    };

      plugins.lsp.servers = {
      pyright.enable = true;
      nixd.enable = true;
      clangd.enable = true;
      ts_ls.enable = true;
      html.enable = true;
      cssls.enable = true;
      gopls.enable = true;
      lua_ls.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true; 
      emmet_ls.enable = true;
      jdtls.enable = true; 
      gdscript = {
         enable = true;
         package = null; 
        };
      kotlin_lsp = {
      enable = true;
      package = null;
      };
        sqls.enable = true;
      };

    plugins.transparent = {
      enable = true;
      settings.extra_groups = [
        "NormalFloat"
        "NvimTreeNormal"
      ];
    };
   
    plugins.none-ls = {
    enable = true;
    sources.formatting = {
    prettier = {
    enable = true; 
    disableTsServerFormatter = true; 
    };
    gofmt.enable = true;
    black.enable = true;
      };
    };
    

  };




}
