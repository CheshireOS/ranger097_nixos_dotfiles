{ config, pkgs, osConfig, inputs, ... }:

let
 myCursor = pkgs.runCommand "local-cursor" {} ''
 mkdir -p $out/share/icons/Pokemon
 cp -r ${./icons/Pokemon}/* $out/share/icons/Pokemon/ 
 '';
in

{
  home.username = "ranger";
  home.homeDirectory = "/home/ranger";
  home.stateVersion = "26.05"; 
  home.pointerCursor = {
  enable = true;
  package = myCursor;
  name = "Pokemon";
  size = 32;
  gtk.enable = true;
  x11.enable = true;
  };
 
  home.file = {
    ".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;
    ".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
    ".config/hypr/hyprsunset.conf".source = ./hypr/hyprsunset.conf;
    ".config/waybar".source = ./waybar; 
    ".config/alacritty".source = ./alacritty;
    ".config/walker".source = ./walker; 
    ".config/wlogout".source = ./wlogout;
 };


programs.firefox = {
enable = true;
policies = {

ExtensionSettings = {

  "uBlock0@raymondhill.net" = {
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
   };
    
  "{076a4b3d-2400-4b53-93d3-8255561a00a1}" = {
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-web-file-icons/latest.xpi";
   };
  
  "jid1-kkvOfwqdnS6YHA@jetpack" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/i-dont-care-about-cookies/latest.xpi";
   };
  
    
  "{3a44d656-7848-4067-9f6c-8a07c3761763}" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/spoof-timezone/latest.xpi";
   };
        
  "{68694065-9851-4091-a83d-3b56a953d611}" = {
        installation_mode = "force_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/user-agent-string-switcher/latest.xpi";
   };


   "@react-devtools" = {
        installation_mode = "forced_installed";
	install_url = "https://addons.mozilla.org/firefox/downloads/file/4432990/react_devtools-6.1.1.xpi";
    };
  };
};

profiles.ranger = {
  isDefault = true;

  extensions = {
  force = true;
  packages = with inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons; [
  ublock-origin
  catppuccin-web-file-icons
  i-dont-care-about-cookies
  protondb-for-steam
  spoof-timezone
  user-agent-string-switcher
  react-devtools
  ];
};
       
userChrome = builtins.readFile ./css/firefox_userchrome.css;
userContent = builtins.readFile ./css/firefox_usercontent.css;

settings = {
   "extensions.autoDisableScopes" = 0;
   "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
   "webgl.disabled" = false;
   "privacy.resistFingerprinting" = true;
   "privacy.clearOnShutdown.history" = true;
   "privacy.clearOnShutdown.cookies" = true;
   "network.cookie.lifetimePolicy" = 0;
   "extensions.enabledAddons" = "uBlock0@raymondhill.net:1.55.0"; 
   "extensions.ublock0.allowInPrivateBrowsing" = true;
   "extensions.ublock0.adminSettings" = builtins.toJSON {
    userSettings = {
    extensionDisabled = false;
    };

    selectedFilterLists = [
    "ublock-filters"
    "ublock-badware"
    "ublock-privacy"
    "ublock-unbreak"
    "ublock-quick-fixes"
    "easylist"
    "easyprivacy"
    ];
  };
};
      
bookmarks = {
force = true;
settings = [ 
	     { name = "WGU";                     url = "https://www.wgu.edu/"; }
             { name = "GITHUB";                  url = "https://www.github.com/"; }
             { name = "NIX PKGS";                url = "https://search.nixos.org/packages"; }
             { name = "HOME.NIX";                url = "https://mynixos.com/home-manager/options/programs"; }
	     { name = "MDN DOCS";                url = "https://developer.mozilla.org/en-US/"; }
	     { name = "ZIG GUIDE";               url = "https://zig.guide/"; }
	     { name = "ZIG DOCS";                url = "https://ziggit.dev/t/zig-learning-resources/3160"; }
	     { name = "EXERCISM";                url = "https://exercism.org/"; }
	     { name = "PRO WITH ZIG";            url = "https://gencmurat.com/en/pages/programming-with-zig/"; }
	     { name = "SVELTE DOCS";             url = "https://svelte.dev/docs/kit/introduction"; }
	     { name = "JAVA DOCS";               url = "https://www.w3schools.com/java/java_exercises.asp"; }
	     { name = "CODE WARS";               url = "https://www.codewars.com/";}
	     { name = "TUF";                     url = "https://takeuforward.org/home";}
	     { name = "UIVERSE";                 url = "https://uiverse.io/";}
	     { name = "YOUTUBE";                 url = "https://www.youtube.com/";}
	     { name = "NIX PILLS";               url = "https://nixos.org/guides/nix-pills/01-why-you-should-give-it-a-try.html";}
	     { name = "ZERO TO NIX";             url = "https://zero-to-nix.com/start/";}
	     { name = "LINUX JOURNEY";           url = "https://labex.io/linuxjourney";}
	     { name = "BASH ACADEMY";            url = "https://guide.bash.academy/";}
	     { name = "T.O.P.";                  url = "https://www.theodinproject.com/";}
	     { name = "BOOT.DEV";                url = "https://www.boot.dev/";}
	     { name = "CHATGPT";                 url = "https://chatgpt.com/";}
	     { name = "COODEVERSE C";            url = "https://coodeverse.com/courses/c-course";}
	     { name = "COODEVERSE C++";          url = "https://coodeverse.com/courses/c-plus-course";}
	     { name = "COODEVERSE KOTLIN";       url = "https://coodeverse.com/courses/kotlin-course";}
	     { name = "LEETCODE";                url = "https://leetcode.com/";}
	     { name = "RYCEE";                   url = "https://nur.nix-community.org/repos/rycee/";}
	     { name = "RUNTIME";                 url = "about:debugging#/runtime/this-firefox";}
	     { name = "NERD FONTS";              url = "https://www.nerdfonts.com/cheat-sheet";}
	     { name = "SCHEMA";                  url = "https://schema.org/docs/full.html";}
	     { name = "GEMINI";                  url = "https://gemini.google.com/app";}
	     { name = "GOOGLE FONTS";            url = "https://fonts.google.com/?preview.script=Latn";}
	     { name = "SPRING ACADEMY";             url = "https://spring.academy/paths/spring-certified-professional-2023";}
	     { name = "RUST BOOK";               url = "https://doc.rust-lang.org/book/title-page.html";}
	     { name = "COMP RUST";               url = "https://google.github.io/comprehensive-rust/";}
	     { name = "RUST EXAMPLE";            url = "https://doc.rust-lang.org/rust-by-example/";}
	     { name = "RUST DOCS";               url = "https://doc.rust-lang.org/stable/";}
	     { name = "FLAT ICON";               url = "https://www.flaticon.com/icon-fonts-most-downloaded?weight=bold&type=uicon";}
	     { name = "JDBC TUTORIAL";           url = "https://medium.com/@khan.abdulwasey99/step-by-step-process-on-how-to-connect-a-spring-boot-application-to-supabase-f1791e1d2402";}
	     { name = "SUPABASE DOCS";                url = "https://supabase.com/docs";}
	     { name = "VERCEL";                    url = "https://vercel.com/";}
	     { name = "AWS";                       url = "https://aws.amazon.com/";}
	     { name = "SPRING IO DOCS";                 url = "https://docs.spring.io/spring-boot/documentation.html";}
	     { name = "SPRING BOOT SUPABASE TEMPLATE";   url = "https://github.com/ChangeNode/spring-boot-supabase/tree/main";}
	     { name = "WALLHAVEN";                       url = "https://wallhaven.cc/";}
	     { name = "LOGOIPSUM";                                url = "https://logoipsum.com/";}
	  ];
	};
     };
  };

programs.freetube = {
   enable = true;
   settings = {
   allowDashAv1Formats = true;
   checkForUpdates     = false;
   defaultQuality      = "2160";
   baseTheme           = "black";
   hideHeaderLogo = true;
   hideLabelsSideBar = true;
   mainColor = "CatppuccinFrappeFlamingo";
    secColor = "CatppuccinFrappeBlue";
   };
};

programs.ghostty.enable = true;
programs.ghostty.settings = {};

xdg.configFile."ghostty/config".source = ./ghostty/config;
xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
xdg.configFile."hypr/hyprland.conf".source = ./hypr/hyprland.conf;

wayland.windowManager.hyprland = {
enable = false;
configType = "hyprlang";
systemd.enable = false;
extraConfig = ''
monitor = ${ if osConfig.networking.hostName == "jirachi"
	     then "eDP-1, 3840x2400@59.99400, 0x0, 3"
             else "eDP-1, 1920x1080@60.054, 0x0, 1"}
'';  
};

home.sessionVariables = {
  GBM_BACKEND = "nvidia-drm";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  LIBVA_DRIVER_NAME = "nvidia";
};

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
