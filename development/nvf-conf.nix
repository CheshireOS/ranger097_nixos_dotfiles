{ config, pkgs, lib, ... }:{

   vim = {
       theme = {
         enable = true;
         name = "gruvbox";
         style = "dark";
       };
       
       status.lualine.enable = true;
       telescope.enable = true;
       autocomplete.nvim-cpm.enable = true;    
      
       
       languages = {
       enableLSP = true;
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

    settings = {
       vim.viAlias = false;
       vim.vimAlias = true;
       vim.lsp = {
          enable = true;
       };
    };

}
