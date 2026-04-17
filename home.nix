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
  home.stateVersion = "25.11"; 
  home.pointerCursor = {
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

programs.librewolf = {
enable = true;
  
    policies = {
        ExtensionSettings = { 
	   "solid-black@paiton.it" = {
              installation_mode = "force_installed";
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/solid-black-theme/latest.xpi";
           };
        };
     };

    profiles.ranger = {
       isDefault = true;
       extensions.packages = with inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons; [
             ublock-origin
          ];
        
          userContent = ''
	@-moz-document domain("duckduckgo.com") {
        * {
    color: grey !important;
    border: 0px solid black !important;
}


body {
    background: linear-gradient(rgba(0,0,0,1));
}

.is-mobile .yQDlj3B5DI5YO8c8Ulio, .yQDlj3B5DI5YO8c8Ulio.jHKRD_8UMD51jfnKQ1LL {
  background-color: #000;
}

.is-mobile .At_VJ9MlrHsSjbfCtz2_ .EcE0RD8NCNGe61Kp815G:not(.zqdPZIKd0gTxkTPnBBos), .is-mobile .At_VJ9MlrHsSjbfCtz2_ .wLL07_0Xnd1QZpzpfR4W:not(.zqdPZIKd0gTxkTPnBBos), .is-mobile .gdzyb9PgLazLyi4DKK0O .EcE0RD8NCNGe61Kp815G:not(.zqdPZIKd0gTxkTPnBBos), .is-mobile .gdzyb9PgLazLyi4DKK0O .wLL07_0Xnd1QZpzpfR4W:not(.zqdPZIKd0gTxkTPnBBos) {
  background-color: #000;
  margin: 0 -7px;
}


:root {
  --ducksans-product-letter-spacing: 0.005em;
  --col-white: #000;
  --col-gray-90: #222;
  --col-gray-25: #000;
  --col-gray-10: #000;
  --col-gray-0: #000;
  --theme-col-bg-page: var(--col-white);
  --theme-col-bg-expandcollapse: var(--col-gray-0);
  --theme-col-bg-expandcollapse-hover: var(--col-gray-10);
  --theme-col-txt-expandcollapse: var(--col-gray-90);
  --theme-col-border-expandcollapse: var(--col-gray-25);
  --rounded-md: 8px;
  --font-size-unit: (0.9 * 16);
  --px-in-rem: (1rem/var(--font-size-unit));
}


.footer {
  background-color: #000;
  border-top: 1px solid #d9d9d9;
  display: none;
}

.is-vertical-tabs-exp .header-wrap {
  background-color: #000;
}

.T265XEcezvjUhK71U8pN {
  display: -webkit-flex;
  display: -moz-box;
  display: flex;
  -webkit-flex-direction: row;
  -moz-box-orient: horizontal;
  -moz-box-direction: normal;
  flex-direction: row;
  -webkit-justify-content: space-between;
  -moz-box-pack: justify;
  justify-content: space-between;
  -webkit-align-items: center;
  -moz-box-align: center;
  align-items: center;
  gap: var(--sds-space-x02);
  overflow: hidden;
  background-color: var(--theme-col-bg-search,#202020);
  border-radius: 13px;
  box-shadow: 0 0 0 1px rgba(0,0,0,.08),0 2px 3px 0 rgba(0,0,0,.06);
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  height: 100%;
  margin: 0;
  padding: 0 8px 0 0;
  position: relative;
  color: var(--sds-color-text-01);
}
      }

	@-moz-document domain("youtube.com") {
         .ytSearchboxComponentSearchButton {
border: 0px solid transparent;
background-color: #f8f8f8;
width: 64px;
border-radius: 0 40px 40px 0;
-moz-box-pack: center;
justify-content: center;
cursor: pointer;
padding: 0;
margin: 0;
color: inherit;
box-shadow: inset 0px 0px 0px 0px rgba(255,255,255,0) !important;
}
    
#container {
backdrop-filter: blur(10px);
background: linear-gradient(rgba(0, 0, 0, .5)) !important; 
border-bottom: 2px solid #000000 !important; 
}
    
html:not(#⁠), body>div,body>table,
[role="navigation"], [role="dialog"],
#body-container>div, [aria-expanded="true"]:not(.ytp-button),
[class*="tooltip"]:not(.ytp-tooltip-duration):not(.ytp-tooltip-bg):not(.ytp-tooltip-text-wrapper):not([class*="arrow"]):not(button),             [role="menu"], .ytp-popup, .videoAdUiPreSkipButton,
.videoAdUiAdInfoPopup {
background:url(/*[[_]]*/)fixed #000!important;
background-size:cover!important
}
    
/*search bar*/#masthead-search-terms,
form.channels-search:not(#​) {
border:1px solid #FFF!important
} 
    
#masthead-search-terms.gsfe_a {
border:1px solid #A0A0A0!important
} 

#masthead-search-terms.gsfe_b {
border:1px solid #4D90FE!important
}

:not(textarea):not(input):not([contenteditable]) {
text-shadow:0 0.05em rgba(0,0,0,.5),0 -0.05em rgba(0,0,0,.5),0.05em 0 rgba(0,0,0,.5),-0.05em 0 rgba(0,0,0,.5)!important
}

:not([class*="video-extras-sparkbar"]):not([class^="ytp-"]):not(.sidebar):not(.video-time):not([class^="html5-"]):not(.yt-uix-button-primary):not(label):not(.toggle):not(.branding-context-container-inner):not(.iv-drawer) {
background-color:transparent!important;
color:/*[[Font]]*/!important
}
    
.load-more-button {
background:transparent!important
}
    
[role="alert"],.content-region,
.yt-uix-checkbox-on-off .checked:before{
display:none!important
}
    
:not(#​) :link{
color:/*[[Link]]*/!important
}
    
:not(#​) :visited{
color:/*[[Visited]]*/!important
}
    
:not(#​) select{
background:black!important
}
    
[href="/"][id*="logo"],
:not(.ytp-volume-slider-handle):not(.yt-uix-playlistlike):before,
.yt-uix-button-icon-material-upload,
.yt-uix-button-icon-bell,
.yt-uix-button-icon-wrapper>.yt-sprite,
.autoplay-info-icon,
.search-button>.yt-uix-button-content,
#appbar-guide-button .yt-uix-button-icon-wrapper,
.yt-uix-button-shelf-slider-pager {
-webkit-filter:invert(1)hue-rotate(180deg);
filter:invert(1)hue-rotate(180deg)
}

.yt-uix-form-input-select,
[class$="container"],
#yt-comments-paginator {
background-image:none!important
}
    
:not(h2):not(button):not(.comment-simplebox-renderer-collapsed-content),
#footer-container button,
.yt-uix-button-shelf-slider-pager {
border:none!important
}
    
textarea,
[contenteditable="true"],
[type="text"]:not(#masthead-search-term),
[role="menu"]:not(.guide-user-links):not(.ytp-panel-menu),
#footer-container .yt-uix-button-default,
.yt-uix-clickcard-card-visible,
#watch-appbar-playlist,
.comment-simplebox-frame,
body>table {
box-shadow:inset 0px 0px 0px 1px rgba(255,255,255,0)!important
}
    
#masthead-search-terms {
box-shadow:none!important
}
     
* {
color: #848484 !important;    
box-shadow:inset 0px 0px 0px 1px rgba(255,255,255,0)!important;
text-shadow: 0px 0px 1px rgba(255,255,255,0)!important;
        
}
    
*:hover {
color: #bababa !important;
}
    
a:hover {
color: #bababa !important;      
}
    
.ytSearchboxComponentSuggestionsContainer,
.ytSearchboxComponentSuggestionsContainerDark, .ytSearchboxComponentSuggestionsContainerScrollable {
backdrop-filter: blur(10px) !important;
background: linear-gradient(rgba(0, 0, 0, 0.8)) !important; 
border-bottom: 2px solid #000000 !important; 
border-radius: 0px 0px 20px 20px;
margin-top: 6px;
}

video {
filter: saturate(100%) contrast(105%) !important;
}
    
img {
filter: saturate(0%) brightness(50%) contrast(115%) !important;
}

img:hover {
filter: saturate(100%) brightness(100%) contrast(100%) !important;
}
    
    
:not(textarea):not(input):not([contenteditable]) {
text-shadow: none !important;
}


	}
      '';



        settings = {
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
	    { name = "WGU";           url = "https://www.wgu.edu/"; }
	    { name = "GITHUB";        url = "https://www.github.com/"; }
	    { name = "NIX PKGS";      url = "https://search.nixos.org/packages"; }
            { name = "HOME.NIX";      url = "https://mynixos.com/home-manager/options/programs"; }
	    { name = "MDN DOCS";      url = "https://developer.mozilla.org/en-US/"; }
	    { name = "ZIG GUIDE";     url = "https://zig.guide/"; }
	    { name = "ZIG DOCS";      url = "https://ziggit.dev/t/zig-learning-resources/3160"; }
	    { name = "EXERCISM";      url = "https://exercism.org/"; }
	    { name = "PRO WITH ZIG";  url = "https://gencmurat.com/en/pages/programming-with-zig/"; }
	    { name = "SVELTE DOCS";   url = "https://svelte.dev/docs/kit/introduction"; }
	    { name = "JAVA DOCS";     url = "https://www.w3schools.com/java/java_exercises.asp"; }

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
programs.ghostty.settings = {
theme = "Catppuccin Mocha";
custom-shader = [
"/persist/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/starfield.glsl"
#"/persist/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/ripple_cursor.glsl"
"/persist/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/cursor_blaze.glsl"
#"/persist/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/aurora.glsl"
];

custom-shader-animation = "always";
background-opacity = 1.0;
adjust-cell-height = 10;
background = "#000000";
foreground = "#A1D9CD";

#FONT_SETTINGS
font-family = "Maple Mono NF CN";
font-family-italic = "Maple Mono NF CN";
font-size = 12;
font-style-bold = "Bold";
font-style-italic = "ExtraLight Italic";
font-style = "ExtraLight";
font-feature = "calt";

#WINDOW_SETTINGS
window-padding-x = 20;
window-padding-y = 20;
confirm-close-surface = false;
window-step-resize = true;
};

home.sessionVariables = {
  GBM_BACKEND = "nvidia-drm";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  LIBVA_DRIVER_NAME = "nvidia";
};

wayland.windowManager.hyprland = {
enable = true;
systemd.enable = false;
extraConfig = ''
#ranger097
monitor = ${ if osConfig.networking.hostName == "jirachi"
	     then "eDP-1, 3840x2400@59.99400, 0x0, 3"
             else "eDP-1, 1920x1080@60.054, 0x0, 1"}   

#INFORMATION
ecosystem:no_update_news = true

#AUTOSTART
exec-once = ghostty
exec-once = bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/wifi.sh
exec-once = bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/waybar.sh
exec-once = bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/startup.sh
#exec-once = LD_LIBRARY_PATH=/run/opengl-driver/lib mpvpaper -o "no-audio --loop-playlist --panscan=1.0 hwdec=auto" eDP-1 /home/ranger/Videos/wallpapers/guweiz.mp4
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once = systemctl --user start hyprpolkitagent
exec-once = hyprctl setcursor Pokemon 32
exec-once = elephant
exec-once = systemctl --user start hyprpolkitagent 

#ENVIRONMENT
#env = HYPRCURSOR_THEME,Pokemon
#env = HYPRCURSOR_SIZE, 32
env = XCURSOR_THEME,Pokemon
env = XCURSOR_SIZE, 32
env = QT_QPA_PLATFORMTHEME,qt6ct
env = QT_QPA_PLATFORM,wayland
env = GDK_SCALE,1
env = GDK_DPI_SCALE,1
env = GODOT_PLATFORM,wayland
env = XDG_SESSION_TYPE,wayland

cursor {
no_hardware_cursors = true
use_cpu_buffer = true
}

xwayland {
force_zero_scaling = true
use_nearest_neighbor = true
}

#PERMISSIONS
permission = /usr/(bin|local/bin)/hyprpm, plugin, allow

#SETTINGS_START
general {
#GAPS
gaps_in = 2
gaps_out = 10, 10, 10, 10
border_size = 1

#BORDER
#col.active_border = $right_border rgba(0,0,0,1) rgba(0,0,0,1) rgba(0,0,0,1) rgba(0,0,0,1) $left_border
#col.inactive_border = $right_border rgba(0,0,0,1) rgba(0,0,0,1) rgba(0,0,0,1) rgba(0,0,0,1) $left_border

col.active_border = rgba(166,227,161,1) rgba(202,211,240,1)
col.inactive_border = rgba(180,190,254,1) rgba(202,211,240,1)

#BORDER_ANIMATION
animations {
bezier = linear, 0.0, 0.0, 0.0, 0.0
animation = borderangle, 1, 50, linear, loop
}

#ALTERNATIVE
resize_on_border = true
allow_tearing = false
layout = dwindle
}
#SETTINGS_END

#WINDOW_SETTINGS_START
decoration { 
rounding = 0
rounding_power = 2
active_opacity = 1.0
inactive_opacity = 1.0

#SHADOW
shadow {
enabled = true
range = 5
render_power = 2
color = rgba(0,0,0,0.5)
offset = 0 0
sharp = false
scale = 1.0
}

#BLUR
blur {
enabled = true
size = 7
passes = 7
contrast = 1.0
vibrancy = 0
vibrancy_darkness = 0
brightness = 1.0
noise = 0.02
popups = true
ignore_opacity = true
}
}
#WINDOW_SETTINGS_END

#ANIMATION_SETTINGS_START
animations {
enabled = yes, please :)
bezier = easeOutQuint,0.23,1,0.32,1
bezier = easeInOutCubic,0.65,0.05,0.36,1
bezier = linear,0,0,1,1
bezier = almostLinear,0.5,0.5,0.75,1.0
bezier = quick,0.15,0,0.1,1
animation = global, 1, 10, default
animation = border, 1, 5.39, easeOutQuint
animation = windows, 1, 4.79, easeOutQuint
animation = windowsIn, 1, 4.1, easeOutQuint, popin 80%
animation = windowsOut, 1, 1.49, linear, popin 80%
animation = fadeIn, 1, 1.73, almostLinear
animation = fadeOut, 1, 1.46, almostLinear
animation = fade, 1, 3.03, quick
animation = layers, 1, 3.81, easeOutQuint
animation = layersIn, 1, 4, easeOutQuint, fade
animation = layersOut, 1, 1.5, linear, fade
animation = fadeLayersIn, 1, 1.79, almostLinear
animation = fadeLayersOut, 1, 1.39, almostLinear
animation = workspaces, 1, 1.94, almostLinear, fade
#animation = workspacesIn, 1, 1.21, almostLinear, fade
animation = workspacesOut, 1, 1.94, almostLinear, fade
animation = workspaces, 1, 2.5, almostLinear, slidefadevert
}
#ANIMATION_SETTINGS_END

#DWINDLE_SETTINGS_START
dwindle {
pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
preserve_split = true # You probably want this
}
#DWINDLE_SETTINGS_END

#MASTER_SETTINGS_START
master {
new_status = master
}
#MASTER_SETTINGS_END

#MISC_SETTINGS_START
misc {
force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
session_lock_xray = true
}
#MISC_SETTINGS_END

#INPUT_SETTINGS_START
input {
kb_layout = us
kb_variant =
kb_model =
kb_options =
kb_rules =
follow_mouse = 1
sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
touchpad {
natural_scroll = false
}
}
#INPUT_SETTINGS_END

#DEVICE_SETTINGS_START
device {
name = epic-mouse-v1
sensitivity = -0.5
}
#DEVICE_SETTINGS_END

#KEYBINDINGS_SETTINGS_START
bind = SUPER, Return, exec, ghostty
bind = SUPER, Q, killactive,
bind = SUPER, Z, togglefloating,
bind = SUPER, A, exec, /run/current-system/sw/bin/walker || pkill walker
bind = SUPER, J, togglesplit, # dwindle
bind = SUPER, B, exec, librewolf
bind = SUPER, D, exec, dolphin
bind = SUPER, C, exec, code
bind = SUPER, F, fullscreenstate, 2
bind = SUPER, X, exec, direnv exec /persist/home/ranger/ranger097_nixos_dotfiles/python/waybar_switcher/ python3 /persist/home/ranger/ranger097_nixos_dotfiles/python/waybar_switcher/waybar_switcher.py
bind = SUPER, M, exec, direnv exec /persist/home/ranger/ranger097_nixos_dotfiles/python/bluelight_toggle/ python3 /persist/home/ranger/ranger097_nixos_dotfiles/python/bluelight_toggle/bluelight_toggle.py
bind = SUPER, H, exec, hyprshot -m output -m eDP-1
bind = SUPER, P, exec, systemctl --user restart pipewire

# Move focus with mainMod + arrow keys
bind = SUPER, left, movefocus, l
bind = SUPER, right, movefocus, r
bind = SUPER, up, movefocus, u
bind = SUPER, down, movefocus, d
bind = SUPER, L, exec, hyprlock

# Switch workspaces with mainMod + [0-9]
bind = SUPER, 1, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, 3, workspace, 3
bind = SUPER, 4, workspace, 4
bind = SUPER, 5, workspace, 5
bind = SUPER, 6, workspace, 6
bind = SUPER, 7, workspace, 7
bind = SUPER, 8, workspace, 8
bind = SUPER, 9, workspace, 9
bind = SUPER, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4
bind = SUPER SHIFT, 5, movetoworkspace, 5
bind = SUPER SHIFT, 6, movetoworkspace, 6
bind = SUPER SHIFT, 7, movetoworkspace, 7
bind = SUPER SHIFT, 8, movetoworkspace, 8
bind = SUPER SHIFT, 9, movetoworkspace, 9
bind = SUPER SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = SUPER, S, togglespecialworkspace, magic
bind = SUPER SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = SUPER, mouse_down, workspace, e+1
bind = SUPER, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = SUPER, mouse:272, movewindow
bindm = SUPER, mouse:273, resizewindow

# Laptop multimedia keys for volume and LCD brightness
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

# Requires playerctl
bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous
#KEYBINDING_SETTINGS_END

#WINDOW_RULE_SETTINGS_START
windowrule = match:class com.mitchellh.ghostty, opacity 1.0
windowrule = match:class librewolf, opacity 1.0
windowrule = match:class discord, opacity 1.0
windowrule = match:fullscreen opacity 1.0 override
windowrule = match:class libreoffice-writer, opacity 1.0
windowrule = match:class org.pulseaudio.pavucontrol, opacity 1.0
windowrule = match:class .blueman-manager-wrapped, opacity 1.0
#WINDOW_RULE_SETTINGS_END

#LAYER_RULE_SETTINGS_START
layerrule = blur on, match:namespace walker
layerrule = match:namespace walker, ignore_alpha 0.7
layerrule = match:namespace waybar, ignore_alpha 0.001
layerrule = blur off, match:namespace waybar
layerrule = blur on, match:namespace wlogout
#LAYER_RULE_SETTINGS_END
'';  
};

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
