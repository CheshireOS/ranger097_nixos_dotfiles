{ config, pkgs, lib, ... }:{

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
   settings.view = {
   width = 30;
   side = "left";
     };
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
      zls.enable = true;
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

      colorschemes.catppuccin = {
      autoLoad = true;
      enable = true;
      settings = {
         flavour = "mocha";
         transparent_background = true;
         term_colors = false;
    
      integrations = {
        cmp = true;
        treesitter = true;
        nvimtree = true;
        telescope.enabled = true;
       };
     };
   };

    colorschemes.kanagawa = {
    autoLoad = true;
    enable = false;
    settings = {
    transparent = true;
    functionStyle = {
    italic = true;
    };
    keywordStyle = {
    italic = true;
    };
    commentStyle = {
    italic = true;
    };
    typeStyle = {
    italic = true;
    };
    undercurl = true;
    theme = "dragon";
      };
    };
    




   extraConfigLua = ''   

   vim.cmd("colorscheme catppuccin-mocha")
    --vim.cmd("colorscheme kanagawa-dragon")   

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
    ];
        
    extraPackages = with pkgs; [
    tree-sitter
    ];
  };
}
