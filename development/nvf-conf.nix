{ config, pkgs, lib, ... }:{

environment.variables.EDITOR = "nvim";
environment.variables.VISUAL = "nvim";

programs.nvf = {
   enable = true;
   settings.vim = {
       autocomplete.nvim-cmp.enable = true;
       statusline.lualine.enable = true;
       telescope.enable = true;        
       lsp.enable = true;
       viAlias = false;
       vimAlias = true;
       theme = {
         enable = false;
         name = "gruvbox";
         style = "dark";
       };
       
       extraPlugins = with pkgs.vimPlugins; {
          wal-vim = {
             package = wal-vim;
          };
       }; 

       luaConfigRC.post = ''
          vim.cmd('colorscheme wal')
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
