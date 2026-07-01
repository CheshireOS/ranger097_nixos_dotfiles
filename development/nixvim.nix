{ config, pkgs, lib, ... }:{

programs.nixvim = {
  
  enable = true;
  defaultEditor = true;

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

    opts = {
       number = true;         
       relativenumber = false; 
       shiftwidth = 2;   
       termguicolors = true;
       background = "dark";    
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


  plugins.cmp-tabby = {
  enable = true;
  autoLoad = true;
  };

  plugins.treesitter = {
  enable = true;
  autoLoad = true;
  };

  plugins.bufferline = {
  enable = true;
  autoLoad = true;
  };

  plugins.conform-nvim = { 
  enable = true; 
  settings.formatters_by_ft = {
  nix = [ "alejandra" ];
      lua = [ "stylua" ];
      python = [ "black" ];
      javascript = [ "prettier" ];
      typescript = [ "prettier" ];
};
  };

  globals.mapleader = " "; 
  plugins.nvim-tree = {
  autoLoad = true; 
  enable = true;
  settings.view = {
  width = 30;
  side = "left";
   
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
    plugins.jdtls.enable = true;
    plugins.auto-save.enable = true;
    plugins.dotnet.enable = true;
    plugins.fzf-lua.enable = true;
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
    
};
    
    plugins.lsp.servers = {
      zls.enable = true;
      pyright.enable = true;
      nixd.enable = true;
      clangd.enable = false;
      ts_ls.enable = true;
      html.enable = true;
      cssls.enable = false;
      gopls.enable = true;
      lua_ls.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true; 
      #emmet_ls.enable = true; 
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

      
   extraConfigLua = ''  

   vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

   vim.cmd("colorscheme catppuccin-mocha")
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
             },
           },
         },
       })
    '';
};
}
