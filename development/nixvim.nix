{ config, pkgs, lib, ... }:

let
  pywal = pkgs.vimPlugins.pywal-nvim;
in 

{

programs.nixvim = {
   enable = true;
   defaultEditor = true;
   terminalColors = false;

    keymaps = [{
      mode = "n";
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
         silent = true;
         desc = "Toggle NvimTree";
        };
      }];
     
    globals.mapleader = " "; 
    plugins.treesitter = {
    enable = true;
    settings.highlight.enable = true;
    settings.indent.enable = true;
    package = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
    nixGrammars = false;
    };
    
    plugins.nvim-tree = {
    autoLoad = true; 
    enable = true;
    openOnSetup = true;
    settis.view = {
      width = 30;
      side = "left";
      };
    };

    plugins.floaterm = {
    enable = true;
    autoLoad = true;
    };

    plugins.barbar = {
       enable = true;
       autoLoad = true;

      keymaps = {
    next.key = "<TAB>";
    previous.key = "<S-TAB>";
    close.key = "<leader>x";
  };
       settings = {
	auto_hide = 1;
	maximum_padding = 3;
	minimum_padding = 1;
	tabpages = true;
          animation = false;
          exclude_ft = [
             "oil"
             "qf"
             "fugitive"
          ];
          exclude_name = [
             "UnicodeTable.txt"
          ];
   highlight_alternate = false;
   icons = {
    button = false;
    separator = {
    left = "";
    right = "";
    seperator_at_end = false;
    };
   };
    };
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
      sqls.enable = true;

      gdscript = {
         enable = true;
         package = null; 
      };

      kotlin_lsp = {
         enable = true;
         package = null;
        };
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
   vim.api.nvim_set_hl(0, "Normal", { fg = "#c6c6c6", bg = "NONE" })
   vim.api.nvim_set_hl(0, "NormalNC", { fg = "#c6c6c6", bg = "NONE" })
   vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1c1c1c" })
   vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#1c1c1c" })
   vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#80a0ff", bg = "#1c1c1c" })
   vim.api.nvim_set_hl(0, "LineNr", { fg = "#404040", bg = "NONE" })
   vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
   vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ff0000", bg = "NONE" })
   vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#0000ff", bg = "NONE" })
   vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#c6c6c6", bg = "NONE" })
   vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#80a0ff", bg = "NONE" })
   vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#ae81ff", bg = "NONE", bold = true })
   vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { fg = "NONE", bg = "NONE" })
   vim.api.nvim_set_hl(0, "NvimTreeCursorLineNr", { fg = "NONE", bg = "NONE" })
   vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "NONE", bg = "NONE" })
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
   vim.api.nvim_set_hl(0, "ScrollbarHandle", { bg = "NONE" })
       
       require('lualine').setup({
          options = {
             theme = {
                normal = {
                   a = { bg = "none" },
                   b = { bg = "none" },
                   c = { bg = "none" },
             },
                insert = {
                  a = { bg = "none" },
                   b = { bg = "none" },
                   c = { bg = "none" },
             },
                visual = {
                    a = { bg = "none" },
                   b = { bg = "none" },
                   c = { bg = "none" },
             },
                replace = {
                    a = { bg = "none" },
                   b = { bg = "none" },
                   c = { bg = "none" },
             },
               inactive = {
                    a = { bg = "none" },
                   b = { bg = "none" },
                   c = { bg = "none" },
             },
           }
         }
       })

        require("nvim-tree").setup({
        renderer = {
           highlight_opened_files = "name",
           indent_markers = {
              enable = true,
              icons = { corner = "", edge = "", none = "" },
           },
           icons = {
              webdev_colors = true,
              git_placement = "after",
              glyphs = {
                 default = "",
                 symlink = "",
                 bookmark = "󰆤",
              folder = {
                 default = "󰲂 ",
                 open = " ",
                 empty = " ",
                 empty_open = " ",
                 symlink = " ",
                 symlink_open = " ",
                 arrow_closed = "",
                 arrow_open = "",
               },
               git = {
                  unstaged = "󰽂 ",
                  staged = " ",
                  unmerged = "",
                  renamed = "󰑕 ",
                  untracked = " ",
                  deleted = "󰚃 ",
                  ignored = "◌",
               },
               diagnostics = {
                  hint = "",
                  info = "",
                  warning = "",
                  error = "",
               },
             },
           },
         },
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
