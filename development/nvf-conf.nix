{ config, pkgs, lib, ... }:{

environment.variables.EDITOR = "nvim";
environment.variables.VISUAL = "nvim";

programs.nvf = {
   enable = true;
   settings.vim = {
       options.termguicolors = false;
       options.background = "dark";
       autocomplete.nvim-cmp.enable = true;
       statusline.lualine.enable = true;
       telescope.enable = true;        
       lsp.enable = true;
       viAlias = false;
       vimAlias = true;
       theme = {
         enable = false;
         transparent = true;       
};
       
       extraPlugins = with pkgs.vimPlugins; {
          wal-vim = {
             package = wal-vim;
          };
       }; 

       luaConfigRC.pywal-transparency = ''
       local function set_transparency()
       local hl_groups = {
        "Normal", "NormalFloat", "FloatBorder", "Pmenu", 
        "SignColumn", "LineNr", "CursorLine", "EndOfBuffer",
        "NonText", "NormalNC", "TelescopeBorder", "TelescopeNormal"
       }

      for _, group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
      end
      end

      set_transparency()

  
      vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_transparency,
      })
      '';

       languages = {
       enableTreesitter = true;
       rust.enable = true;
       nix.enable = true;
       sql.enable = true;
       clang.enable = true;
       ts.enable = true;
       python.enable = true;
       zig.enable = true;
       markdown.enable = true;
       html.enable = true;
       go.enable = true;
       lua.enable = true;
       bash.enable = true;
       csharp.enable = true;
       css.enable = true;
       elixir.enable = true;
       kotlin.enable = true;
       nim.enable = true;
       ruby.enable = true;
       svelte.enable = true;
       tailwind.enable = true;
       yaml.enable = true; 
       ocaml.enable = true;       
       };
     };
   };
 }
