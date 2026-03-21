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
         enable = true;
         transparent = true;
	 name = "base16";
         base16-colors = {
      	 base00 = "000000"; #walColors.special.background; 
         base01 = "acacac"; #walColors.colors.color0;      
         base02 = "ff0000"; #walColors.colors.color8;      
         base03 = "ff0000";     
         base04 = "ff0000"; #walColors.colors.color7;      
         base05 = "ff0000"; #walColors.special.foreground; 
         base06 = "ff0000"; #walColors.colors.color7;      
         base07 = "ff0000"; #walColors.colors.color15;     
         base08 = "ff0000"; #walColors.colors.color1;     
         base09 = "ff0000"; #walColors.colors.color9;      
         base0A = "ff0000"; #walColors.colors.color3;      
         base0B = "ff0000"; #walColors.colors.color2;     
         base0C = "ff0000"; #walColors.colors.color6;      
         base0D = "ff0000"; #walColors.colors.color4;      
         base0E = "ff0000"; #walColors.colors.color5;      
         base0F = "ff0000"; #walColors.colors.color13;     
    };

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
