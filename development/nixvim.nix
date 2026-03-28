{ config, pkgs, lib, ... }:

let
  pywal = pkgs.vimPlugins.pywal-nvim;
in 

{

programs.nixvim = {

    highlight = {
      Operator = { fg = "#98BB6C"; };
      Delimiter = { fg = "#98BB6C"; };
      Identifier = { fg = "#7E9CD8"; };
     "@variable" = { fg = "#98BB6C"; };
     "@module" = { fg = "#98BB6C"; };
      Keyword = { italic = true; };
      Function = { italic = true; };
      Comment = { italic = true; };
      Normal = { fg = "#7E9CD8"; };
      Comment = { fg = "#54546D"; };
      Keyword = { fg = "#727169"; };
      Function = { fg = "#98BB6C"; };
      String = { fg = "#7E9CD8"; };
      Constant = { fg = "#D27E99"; };

      NormalNC = { fg = "#7E9CD8"; bg = "none"; };
      CursorLine = { bg = "#1c1c1c"; };
      CursorColumn = { bg = "#1c1c1c"; };
      CursorLineNr = { fg = "#80a0ff"; bg = "#1c1c1c"; };
      LineNr = { fg = "#404040"; bg = "none"; };
      SignColumn = { bg = "none"; };
      StatusLine = { fg = "#54546D"; bg = "none"; };
      StatusLineNC = { fg = "#54546D"; bg = "none"; };

      NvimTreeNormal = { fg = "#DCD7BA"; bg = "none"; };
      NvimTreeFolderName = { fg = "#D27E99"; bg = "none"; };
      NvimTreeRootFolder = { fg = "#98BB6C"; bg = "none"; bold = true; };
      NvimTreeCursorLine = { fg = "none"; bg = "none"; };
      NvimTreeCursorLineNr = { fg = "none"; bg = "none"; };
      NvimTreeIndentMarker = { fg = "none"; bg = "none"; };

      BufferCurrent = { fg = "#7E9CD8"; bg = "none"; ctermbg = "none"; };
      BufferInactive = { fg = "#54546D"; bg = "none"; ctermbg = "none"; };
      BufferVisible = { fg = "#808080"; bg = "none"; ctermbg = "none"; };
      BufferCurrentSign = { fg = "#ffffff"; bg = "none"; ctermbg = "none"; };
      BufferVisibleSign = { fg = "#808080"; bg = "none"; ctermbg = "none"; };
      BufferInactiveSign = { fg = "#808080"; bg = "none"; ctermbg = "none"; };
      BufferCurrentMod = { fg = "#ffffff"; bg = "none"; ctermbg = "none"; };
      BufferVisibleMod = { fg = "#808080"; bg = "none"; ctermbg = "none"; };
      BufferInactiveMod = { fg = "#808080"; bg = "none"; ctermbg = "none"; };
      BufferOffset = { bg = "none"; ctermbg = "none"; };
      BufferTabpageFill = { bg = "none"; ctermbg = "none"; };

      
      ScrollbarHandle = { bg = "none"; };
    };
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
