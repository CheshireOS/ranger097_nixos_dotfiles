{ config, pkgs, lib, ... }:

let
  pywal = pkgs.vimPlugins.pywal-nvim;
in 

{
    programs.nixvim = {
    enable = true;
    defaultEditor = true;
    
    colorscheme = "moonfly";

    colorschemes.oxocarbon = {
    enable = false;
    autoLoad = false;
    };

    colorschemes.moonfly = {
    enable = true;
    autoLoad = true;
       settings = {
       Italics = true;
       NormalFloat = false;
       TerminalColors = false;
       Transparent = true;
       Undercurls = true;
       UnderlineMatchParen = false;
       VirtualTextColor = false;
       WinSeparator = 0;
       };
    };

    terminalColors = false;
        
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options = {
          silent = true;
          desc = "Toggle NvimTree";
        };
      }
    ];
     
    globals.mapleader = " "; 
    plugins.treesitter = {
    enable = true;
    settings.highlight.enable = true;
    settings.indent.enable = true;
    package = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
    nixGrammars = false;
    };
    
    plugins.nvim-tree = {
    enable = true;
    openOnSetup = true;
    settings.view = {
      width = 30;
      side = "left";
      };
    };

    plugins.floaterm = {
    enable = true;
    autoLoad = true;
    };

    plugins.noice.enable = true;
    plugins.noice.autoLoad = true;
    plugins.web-devicons.enable = true;    
    plugins.telescope.enable = true; 
    plugins.lualine.enable = true;
    plugins.luasnip.enable = true;
    plugins.rustaceanvim.enable = true;
    plugins.lsp.enable = true;
    plugins.java = { 
    enable = false;
       settings = {
          spring_boot.enable = false;
       };
    };
    
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
	"<leader>e" = "<cmd>NvimTreeToggle<CR>";
        };

     snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
    };   

    opts = {
      number = true;         
      relativenumber = false; 
      shiftwidth = 2;   
      termguicolors = true;
      background = "dark";    
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
      "NvimTreeNormalNC"
      "TelescopeNormal"
      "TelescopeBorder"
      "LspFloatWinNormal"
      "MsgArea"
      "StatusLine"
      "StatusLineNC"
      "WinSeparator"
      "Folded"
      "EndOfBuffer"
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
    


    extraConfigLua = ''
vim.cmd('highlight Keyword gui=italic')
vim.cmd('highlight Function gui=italic')
vim.cmd('highlight Comment gui=italic')
vim.api.nvim_set_hl(0, "BufferCurrent", { fg = "#ffffff", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferInactive", { fg = "#808080", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferVisible", { fg = "#808080", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = "#ffffff", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = "#808080", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = "#808080", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = "#ffffff", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = "#808080", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = "#808080", bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferOffset", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = "none", ctermbg = "none" })

  require('lualine').setup({
  options = {
    theme = {
      normal = {
        a = { bg = "#000000" },
        b = { bg = "#000000" },
        c = { bg = "#000000" },
      },
      insert = {
        a = { bg = "#000000" },
        b = { bg = "#000000" },
        c = { bg = "#000000" },
      },
      visual = {
        a = { bg = "#000000" },
        b = { bg = "#000000" },
        c = { bg = "#000000" },
      },
      replace = {
        a = { bg = "#000000" },
        b = { bg = "#000000" },
        c = { bg = "#000000" },
      },
      inactive = {
        a = { bg = "#000000" },
        b = { bg = "#000000" },
        c = { bg = "#000000" },
      },
    }
  }
})
    '';

    extraPlugins = [
    pywal   
    ];
        
    extraPackages = with pkgs; [
    tree-sitter
    nodePackages.prettier
    black
    ];
  };
}
