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
  extensions.packages = with inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons; [
  ublock-origin
  catppuccin-web-file-icons
  i-dont-care-about-cookies
  protondb-for-steam
  spoof-timezone
  user-agent-string-switcher
  react-devtools
  ];
       
  userChrome = ''
  #personal-toolbar-empty-description,
  #PersonalToolbar,
  .browser-toolbox-background,
  #nav-bar-customization-target,
  .browser-toolbar,
  .tabbrowser-tab, slot,
  #TabsToolbar, .titlebar-spacer,
  .titlebar-close, toolbarbutton,
  .tab-content, tabbrowser-tab,tabs, 
  #urlbar-container, .urlbar-container, toolbar,
  .searchmode-switcher, #navigator-toolbox, .browser-toolbox-background{
  background-color: #000000;
  color: #96ce92;
  }

  .titlebar-close {
   display: none;
  }

  * {
   border: none !important;
  }

  .text-link, a, ::part(support-link){
  background-color: #000000;
  color: aquamarine !important;

  }

  #PersonalToolbar {
  :root[sessionrestored] &:not(.instant) {
  background-color: #000000 !important;
      }
  }

  #PlacesToolbar, #PlacesToolbarItems {
  background-color: #000000;
  }

  .tab-text {
   color: #707070;
  }

@media not -moz-pref("browser.urlbar.unifiedSearchButton.always") {
  .searchmode-switcher {
    background-color: #000 !important;
  }
}

.outer-wrapper.only-search {
  display: block;
  padding-block-start: calc(var(--space-xxlarge) * 4);
  background-color: #000 !important;
}

.search-handoff-button {
  background-color: #000 !important;
  color: aquamarine !important;
  display: none;
}

  .urlbar[breakout] {
  & > .urlbar-input-container {
    width: 100%;
    height: 100%;
    background-color: #000 !important;
    color: #909090 !important;
  }
}
  '';


userContent = ''
@-moz-document url("about:home"), url("about:newtab") {

body {
  background-color: #000;
  font-family: system-ui;
  font-size: var(--font-size-root);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: var(--newtab-wallpaper-backgroundPosition);
  background-attachment: fixed;
  overflow-y: scroll;
  background-image: url("https://w.wallhaven.cc/full/9o/wallhaven-9orjqw.jpg") !important;
}

.nova-enabled.container {
  container-type: inline-size;
  container-name: outer-grid;
  display: none !important;
  grid-template-columns: var(--side-col-width) var(--content-col-width) var(--side-col-width);
  grid-auto-rows: var(--row-height);
  gap: var(--space-medium);
  justify-content: space-between;
  margin-inline: auto;
  padding-inline: var(--space-xlarge);
}

  .search-handoff-button {
  position: relative;
  background: #000 var(--newtab-search-icon) 16px center no-repeat;
  background-size: var(--size-item-medium);
  padding-inline-start: calc(2 * var(--space-xlarge));
  padding-inline-end: var(--space-small);
  padding-block: 0;
  width: 100%;
  box-shadow: var(--box-shadow-level-3);
  border: var(--content-search-handoff-ui-border-width) solid var(--content-search-handoff-ui-unfocused-border-color);
  border-radius: var(--border-radius-medium);
  color: #808080;
  -moz-context-properties: fill;
  fill: var(--content-search-handoff-ui-fill);

}

:root {
  color-scheme: light;
  --newtab-background-color: #000;
  --newtab-background-color-secondary: #000;
  --newtab-text-primary-color: #808080;
  --newtab-background-card: color-mix(in srgb, var(--color-white) 85%, transparent);
  --newtab-text-topic-label-color: var(--color-violet-70);
  --newtab-text-secondary-text: var(--text-color-deemphasized);
  --newtab-contextual-text-primary-color: light-dark(var(--newtab-text-primary-color), var(--text-color));
  --newtab-primary-action-background: light-dark(var(--color-accent-primary), var(--color-accent-primary));
  --newtab-primary-action-background-pocket: #008078;
  --newtab-text-secondary-color: color-mix(in srgb, var(--newtab-text-primary-color) 70%, transparent);
  --newtab-contextual-text-secondary-color: color-mix(in srgb, var(--newtab-contextual-text-primary-color) 70%, transparent);
  --newtab-weather-background-color: light-dark(rgba(255, 255, 255, 85%), rgba(66, 65, 77, 85%));
  --newtab-element-hover-color: color-mix(in srgb, var(--newtab-background-color) 90%, #000);
  --newtab-element-active-color: color-mix(in srgb, var(--newtab-background-color) 80%, #000);
  --newtab-button-background: var(--button-background-color);
  --newtab-button-focus-background: var(--newtab-button-background);
  --newtab-button-focus-border: var(--focus-outline-color);
  --newtab-button-hover-background: var(--button-background-color-hover);
  --newtab-button-active-background: var(--button-background-color-active);
  --newtab-button-text: var(--button-text-color);
  --newtab-button-static-background: light-dark(#F0F0F4, #2B2A33);
  --newtab-button-static-focus-background: var(--newtab-button-static-background);
  --newtab-button-static-hover-background: light-dark(#000, #52525E);
  --newtab-button-static-active-background: light-dark(#CFCFD8, #5B5B66);
  --newtab-element-secondary-color: color-mix(in srgb, currentColor 5%, transparent);
  --newtab-element-secondary-hover-color: color-mix(in srgb, currentColor 12%, transparent);
  --newtab-element-secondary-active-color: color-mix(in srgb, currentColor 25%, transparent);
  --newtab-primary-element-hover-color: color-mix(in srgb, var(--newtab-primary-action-background) 90%, #000);
  --newtab-primary-element-hover-pocket-color: color-mix(in srgb, var(--newtab-primary-action-background-pocket) 90%, #000);
  --newtab-primary-element-active-color: color-mix(in srgb, var(--newtab-primary-action-background) 80%, #000);
  --newtab-primary-element-text-color: var(--color-white);
  --newtab-primary-action-background-dimmed: color-mix(in srgb, var(--newtab-primary-action-background) 25%, transparent);
  --newtab-primary-action-background-pocket-dimmed: color-mix(in srgb, var(--newtab-primary-action-background-pocket) 25%, transparent);
  --newtab-wordmark-color: light-dark(#20123A, #fbfbfe);
  --newtab-status-success: var(--color-green-50);
  --newtab-status-error: var(--color-red-60);
  --newtab-inner-box-shadow-color: rgba(0, 0, 0, 0.1);
  --newtab-section-card-box-shadow-color: rgba(58, 57, 68, 20%);
  --newtab-overlay-color: color-mix(in srgb, var(--newtab-background-color) 85%, transparent);
  --border-radius-large: 16px;
  --newtab-button-secondary-color: inherit;
}
}


   @-moz-document domain("youtube.com") {

@font-face {
src: url("file://persist/home/ranger/.local/share/fonts/BigBlueTerm437NerdFontMono-Regular.ttf")
}


.ytSearchboxComponentSearchButton {
border: 0px solid transparent;
background-color: #000000;
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
backdrop-filter: blur(0px);
background: linear-gradient(rgba(0, 0, 0, 0)) !important; 
border-bottom: 0px solid #000000 !important; 
}
    
html:not(#⁠), body>div,body>table,
[role="navigation"], [role="dialog"],
#body-container>div, [aria-expanded="true"]:not(.ytp-button),
[class*="tooltip"]:not(.ytp-tooltip-duration):not(.ytp-tooltip-bg):not(.ytp-tooltip-text-wrapper):not([class*="arrow"]):not(button),[role="menu"], .ytp-popup, .videoAdUiPreSkipButton,
.videoAdUiAdInfoPopup {
background:url(/*[[_]]*/)fixed #000!important;
background-size: cover !important;
}
    
/*search bar*/#masthead-search-terms,
form.channels-search:not(#​) {
border: none !important
} 
    
#masthead-search-terms.gsfe_a {
border: none !important;
} 

#masthead-search-terms.gsfe_b {
border: none !important;
}

:not(textarea):not(input):not([contenteditable]) {
text-shadow:0 0.05em rgba(0,0,0,.0),0 -0.05em rgba(0,0,0,.0),0.05em 0 rgba(0,0,0,.0),-0.05em 0 rgba(0,0,0,.0) !important;
}

:not([class*="video-extras-sparkbar"]):not([class^="ytp-"]):not(.sidebar):not(.video-time):not([class^="html5-"]):not(.yt-uix-button-primary):not(label):not(.toggle):not(.branding-context-container-inner):not(.iv-drawer) {
background-color: transparent !important;
color:/*[[Font]]*/ !important;
}
    
.load-more-button {
background: transparent !important;
}
    
[role="alert"],.content-region,
.yt-uix-checkbox-on-off .checked:before{
display:none !important;
}
    
:not(#​) :link{
color:/*[[Link]]*/ !important;
}
    
:not(#​) :visited{
color:/*[[Visited]]*/ !important;
}
    
:not(#​) select{
background: black !important;
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
border:none !important;
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
     
ytd-watch-metadata[title-headline-xs] h1.ytd-watch-metadata {
color: #b997e1 !important;    
box-shadow:inset 0px 0px 0px 1px rgba(255,255,255,0)!important;
text-shadow: 0px 0px 1px rgba(255,255,255,0)!important;
}
    
* {
border: none !important;
box-shadow: none !important;
}
        
.ytSearchboxComponentSuggestionsContainer,
.ytSearchboxComponentSuggestionsContainerDark, .ytSearchboxComponentSuggestionsContainerScrollable {
backdrop-filter: blur(0px) !important;
background: linear-gradient(rgba(0, 0, 0, 0)) !important; 
border-bottom: 0px solid #000000 !important; 
border-radius: 0px 0px 20px 20px;
margin-top: 6px;
}

video {
filter: saturate(100%) contrast(105%) !important;
}
    
img {
filter: saturate(105%) brightness(100%) contrast(105%) !important;
}
    
:not(textarea):not(input):not([contenteditable]) {
text-shadow: none !important;
}


svg {
color: aquamarine !important;
}

yt-formatted-string {
  color: #dcbbbb !important;
}

.ytSearchboxComponentInputBox {
  position: relative;
  -moz-box-align: center;
  align-items: center;
  border: none;
  background-color: transparent;
  box-shadow: none;
  border-radius: 40px 0 0 40px;
  margin-left: 32px;
  padding: 0 4px 0 16px;
  display: -moz-box;
  display: flex;
  -moz-box-flex: 1;
  flex: 1;
  cursor: text;


}

  ytd-app {
  background: url('https://cdna.artstation.com/p/assets/images/images/025/789/352/original/pixel-jeff-galaxy-far-far-away.gif') !important;
  object-fit: contain !important;
  background-repeat: no-repeat !important;
  background-size: cover !important;
  background-attachment: fixed !important;
  background-position: center center !important;
  backdrop-filter: brightness(30%) !important;
}

#secondary.ytd-watch-flexy {
  padding-right: var(--ytd-watch-flexy-horizontal-page-margin);
  width: var(--ytd-watch-flexy-sidebar-width);
  min-width: var(--ytd-watch-flexy-sidebar-min-width);
  position: relative;
  backdrop-filter: blur(0px);
  border-radius: 15px;
  padding: 20px !important;
  margin: 10px 0px !important;
  border: 0px solid #000 !important;
}

ytd-watch-flexy[is-two-columns_][is-extra-wide-video_]:not([fixed-panels]) #primary.ytd-watch-flexy, ytd-watch-flexy[is-two-columns_][is-four-three-to-sixteen-nine-video_]:not([fixed-panels]) #primary.ytd-watch-flexy {
  max-width: var(--ytd-watch-flexy-max-player-width);
  min-width: var(--ytd-watch-flexy-min-player-width);
  backdrop-filter: blur(0px);
  margin: 0px;
  padding: 30px !important;
}

html,
body,
ytd-app,
yt-formatted-string,
tp-yt-paper-item,
tp-yt-paper-tab,
tp-yt-paper-button,
yt-chip-cloud-chip-renderer,
#video-title,
#text,
#content,
#author-text,
#channel-name,
#title,
#description,
#subtitle,
#label,
#message,
#input,
input,
textarea,
button,
a,
span,
div {
    font-family: "BigBlueTerm437 Nerd Font Mono" !important;
}


.ytIconWrapperHost.ytd-logo, yt-icon.ytd-logo {
  height: 20px;
  width: 93px;
  padding: 18px 14px 18px 16px;
  color: var(--t7f9b7e1603e20b94);
  -moz-box-flex: 0;
  flex: none;
  display: none;
}

page-manager.ytd-app {
  --ytd-toolbar-offset: var(--ytd-masthead-height,var(--ytd-toolbar-height));
  backdrop-filter: brightness(30%) !important;
}

#container.ytd-masthead {
  height: 56px;
  padding: 0 16px;
  display: flexbox;
  display: -moz-box;
  display: flex;
  -moz-box-orient: horizontal;
  -moz-box-direction: normal;
  flex-direction: row;
  -moz-box-align: center;
  align-items: center;
  -moz-box-pack: justify;
  justify-content: space-between;
  backdrop-filter: brightness(30%) !important;
}

ytd-watch-flexy[is-two-columns_]:not([full-bleed-player]) #columns.ytd-watch-flexy {
  min-width: calc(var(--ytd-watch-flexy-min-player-height)*var(--ytd-watch-flexy-width-ratio)/var(--ytd-watch-flexy-height-ratio) + var(--ytd-watch-flexy-horizontal-page-margin)*3 + var(--ytd-watch-flexy-sidebar-min-width));
  -moz-box-pack: center;
  justify-content: center;
  backdrop-filter: brightness(30%) !important;
}

ytd-search[has-search-header] {
  padding: 0 24px 16px;
  backdrop-filter: brightness(30%) !important;
}

ytd-mini-guide-renderer.ytd-app {
  position: fixed;
  left: 0;
  top: var(--ytd-masthead-height,var(--ytd-toolbar-height));
  bottom: 0;
  width: var(--ytd-mini-guide-width);
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  backdrop-filter: brightness(30%) !important;
}

ytd-rich-grid-renderer {
  display: -moz-box;
  display: flex;
  -moz-box-orient: vertical;
  -moz-box-direction: normal;
  flex-direction: column;
  -moz-box-align: center;
  align-items: center;
  -moz-box-pack: center;
  justify-content: center;
  --ytd-rich-grid-gutter-margin: 16px;
  --ytd-rich-grid-content-max-width: calc(var(--ytd-rich-grid-items-per-row)*(var(--ytd-rich-grid-item-max-width) + var(--ytd-rich-grid-item-margin)) - var(--ytd-rich-grid-item-margin));
  --ytd-rich-grid-row-margin: 32px;
  backdrop-filter: brightness(30%) !important;
}

ytd-tabbed-page-header.grid-4-columns #page-header.ytd-tabbed-page-header, ytd-tabbed-page-header.grid-4-columns[has-inset-banner] #page-header-banner.ytd-tabbed-page-header {
  padding-right: calc(50% - 428px);
  padding-left: calc(50% - 428px);
  backdrop-filter: brightness(30%) !important;
}

#contentContainer.tp-yt-app-header-layout {
  position: relative;
  z-index: 0;
  backdrop-filter: brightness(30%) !important;
}

ytd-browse[page-subtype="channels"][enable-channel-lockup] {
  --ytd-grid-1-columns-width: 218px;
  --ytd-grid-2-columns-width: 436px;
  --ytd-grid-3-columns-width: 654px;
  --ytd-grid-4-columns-width: 872px;
  --ytd-grid-5-columns-width: 1090px;
  --ytd-grid-6-columns-width: 1308px;
  --ytd-grid-max-width: 1308px;
  backdrop-filter: brightness(30%) !important;
}

ytd-app {
min-height: 1000000vh;
}

.ytSearchboxComponentSuggestionsContainerScrollable {
  padding-top: 8px;
  overflow-y: auto;
  max-height: 80vh;
  scrollbar-width: none;
  -ms-overflow-style: none;
  backdrop-filter: blur(10px) !important;
  display: none;
}

ytd-rich-grid-renderer {
  display: -moz-box;
  display: flex;
  -moz-box-orient: vertical;
  -moz-box-direction: normal;
  flex-direction: column;
  -moz-box-align: center;
  align-items: center;
  -moz-box-pack: center;
  justify-content: center;
  --ytd-rich-grid-gutter-margin: 16px;
  --ytd-rich-grid-content-max-width: calc(var(--ytd-rich-grid-items-per-row)*(var(--ytd-rich-grid-item-max-width) + var(--ytd-rich-grid-item-margin)) - var(--ytd-rich-grid-item-margin));
  --ytd-rich-grid-row-margin: 32px;
  padding-bottom: 1000000vh;
}

.html5-video-player, .ytp-contextmenu {
  -ms-high-contrast-adjust: none;
  forced-color-adjust: none;
  background: rgba(0,0,0,0.30) !important;
}

ytd-watch-flexy[view-transition-enabled]:not([show-engagement-panel-scrim_]) #below.ytd-watch-flexy {
  view-transition-name: metadata;
  backdrop-filter: brightness(30%) !important;
  min-width: 100%;
  margin: 0px -3vw;
  padding: 0px 3vw 0px 3vw;
}

ytd-watch-flexy:not([fixed-panels]) #primary.ytd-watch-flexy {
  min-width: var(--ytd-watch-flexy-min-player-width);
  background: black;
    background-color: black;
  backdrop-filter: brightness(30%) !important;
  margin: 0px;
  padding: 0px 3vw;
}

.html5-video-player, .ytp-contextmenu {
  -ms-high-contrast-adjust: none;
  forced-color-adjust: none;
  background: rgba(0,0,0,0.7) !important;
}

#primary.ytd-watch-flexy {
  padding-right: 0;
  margin-left: 0px !important;
  -moz-box-flex: 1;
  flex: 1;
    flex-basis: 0%;
  flex-basis: 0.000000001px;
  padding: 0px 3vw !important;
}

.html5-main-video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  outline: 0;
  border-radius: 10px !important;
}

.ytLockupMetadataViewModelCompact .ytLockupMetadataViewModelTitle {
  line-height: 2rem;
  font-weight: 500;
  overflow: hidden;
  display: block;
  max-height: 4rem;
  -webkit-line-clamp: 2;
  display: box;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  text-overflow: ellipsis;
  white-space: normal;
  color: #0bf7ff !important;
}

.ytContentMetadataViewModelMetadataText:last-of-type {
  overflow: hidden;
  color: mediumaquamarine !important;
}

.ytContentMetadataViewModelMetadataText {
  font-size: 1.2rem;
  line-height: 1.2rem;
  font-weight: 400;
  white-space: nowrap;
  text-overflow: ellipsis;
  color: #f428f9 !important;
}

.ytContentMetadataViewModelDelimiter {
  margin: 0 4px;
  vertical-align: middle;
  font-size: 1.2rem;
  line-height: 1.8rem;
  font-weight: 400;
  color: #ff546e !important;
}

.ytBadgeShapeText {
  display: block;
  white-space: nowrap;
  color: navajowhite;
}

.ytSearchboxComponentInput {
  padding: 1px 0;
  margin: 0;
  width: 100%;
  border: none;
  box-shadow: none;
  outline: none;
  -webkit-appearance: none;
  -webkit-font-smoothing: antialiased;
  font-size: 1.6rem;
  line-height: 2.2rem;
  font-weight: 400;
  color: darkcyan !important;
}


canvas, caption, center, cite, code, dd, del, dfn, div, dl, dt, em, embed, fieldset, font, form, h1, h2, h3, h4, h5, h6, hr, i, iframe, img, ins, kbd, label, legend, li, menu, object, ol, p, pre, q, s, samp, small, span, strike, strong, sub, sup, table, tbody, td, tfoot, th, thead, tr, tt, u, ul, var {
  margin: 0;
  padding: 0;
  border: 0;
  background: transparent;
    background-color: transparent;
}

:not([class*="video-extras-sparkbar"]):not([class^="ytp-"]):not(.sidebar):not(.video-time):not([class^="html5-"]):not(.yt-uix-button-primary):not(label):not(.toggle):not(.branding-context-container-inner):not(.iv-drawer) {
  background-color: transparent !important;
  color: !important;
}
:not(textarea):not(input):not([contenteditable]) {
  text-shadow: none !important;
}
:not(h2):not(button):not(.comment-simplebox-renderer-collapsed-content), #footer-container button, .yt-uix-button-shelf-slider-pager {
  border: none !important;
}
:not(textarea):not(input):not([contenteditable]) {
  text-shadow: 0 0.05em rgba(0,0,0,.0),0 -0.05em rgba(0,0,0,.0),0.05em 0 rgba(0,0,0,.0),-0.05em 0 rgba(0,0,0,.0) !important;
}
html, body, ytd-app, yt-formatted-string, tp-yt-paper-item, tp-yt-paper-tab, tp-yt-paper-button, yt-chip-cloud-chip-renderer, #video-title, #text, #content, #author-text, #channel-name, #title, #description, #subtitle, #label, #message, #input, input, textarea, button, a, span, div {
  font-family: "BigBlueTerm437 Nerd Font Mono" !important;
}
* {
  border: none !important;
  box-shadow: none !important;
}
#author-text.yt-simple-endpoint.ytd-comment-view-model {
  color: aquamarine;
  white-space: nowrap;
  font-size: 1.3rem;
  font-weight: 500;
  line-height: 1.8rem;
}

.yt-simple-endpoint {
  display: inline-block;
  cursor: pointer;
  text-decoration: none;
  color: plum;
}

.ytAttributedStringWhiteSpacePreWrap {
  white-space: pre-wrap;
  color: antiquewhite;
}

yt-formatted-string[has-link-only_]:not([force-default-style]) a.yt-simple-endpoint.yt-formatted-string {
  color: antiquewhite;
}

.ytAttributedStringLinkInheritColor {
  color: pink !important;
}

.ytSpecButtonShapeNextMono.ytSpecButtonShapeNextTonal {
  color: thistle !important;
}

.ytSpecButtonShapeNextMono.ytSpecButtonShapeNextText {
  color: tomato !important;
}

ytd-comment-engagement-bar {
  color: mediumseagreen !important;
}

ytd-watch-flexy[is-two-columns_]:not([full-bleed-player]) #columns.ytd-watch-flexy {
  min-width: calc(var(--ytd-watch-flexy-min-player-height)*var(--ytd-watch-flexy-width-ratio)/var(--ytd-watch-flexy-height-ratio) + var(--ytd-watch-flexy-horizontal-page-margin)*3 + var(--ytd-watch-flexy-sidebar-min-width));
  -moz-box-pack: center;
  justify-content: center;
  padding: 0vw 5vw;
}

#frosted-glass.with-chipbar.ytd-app {
  background-color: transparent !important;
  backdrop-filter: none !important;
  height: 112px;
}

ytd-feed-filter-chip-bar-renderer,
#chips.ytd-feed-filter-chip-bar-renderer {
  display: none !important;
}

#author-text.yt-simple-endpoint.ytd-comment-view-model {
  margin-right: 4px;
  padding-bottom: 2px;
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  font-size: 1.3rem;
  font-weight: 500;
  line-height: 1.8rem;
  color: palegreen !important;
}

.yt-simple-endpoint {
  display: inline-block;
  cursor: pointer;
  text-decoration: none;
  color: darkseagreen !important;
}

.ytLockupMetadataViewModelCompact .ytLockupMetadataViewModelTitle {
  line-height: 2rem;
  font-weight: 500;
  white-space: normal;
  color: darkturquoise !important;
}

#content-text.ytd-comment-view-model {
  --yt-endpoint-color: var(--t2d807bb79e75606d);
  --yt-endpoint-hover-color: var(--t2d807bb79e75606d);
  --yt-endpoint-visited-color: var(--t2d807bb79e75606d);
  color: var(--tffc2fd3a644f6275);
  font-family: Roboto,"Arial",sans-serif;
  font-size: 1.4rem;
  line-height: 2rem;
  font-weight: 400;
  line-height: 2rem;
  color: aquamarine !important;
}

.ytThumbnailBottomOverlayViewModelHost {
  display: -moz-box;
  display: flex;
  position: absolute;
  bottom: 0;
  right: 0;
  -moz-box-align: end;
  align-items: flex-end;
  -moz-box-pack: end;
  justify-content: flex-end;
  backdrop-filter: blur(0px) brightness(100%) !important;
  padding: 5px 0px 0px 0px !important;
  margin: 4px !important;
  border-radius: 6px !important;
  border: 1px solid black !important;
}

.ytSpecButtonShapeNextCallToAction.ytSpecButtonShapeNextOutline, .ytSpecButtonShapeNextSizeM, #guide-icon.ytd-masthead, .ytIconWrapperHost.ytd-logo, yt-icon.ytd-logo, ytd-topbar-menu-button-renderer #button.ytd-topbar-menu-button-renderer {
  
  display: none !important;
}

textarea, [contenteditable="true"], [type="text"]:not(#masthead-search-term), [role="menu"]:not(.guide-user-links):not(.ytp-panel-menu), #footer-container .yt-uix-button-default, .yt-uix-clickcard-card-visible, #watch-appbar-playlist, .comment-simplebox-frame, body > table {
  box-shadow: inset 0px 0px 0px 1px rgba(255,255,255,0) !important;
  background-color: black !important;
  border: 1px solid aliceblue !important;
  padding: 6px 15px !important;
  border-radius: 100px !important;
  position: relative;
  top: 10px;
}

.ytSearchboxComponentDesktop .ytSearchboxComponentClearButton {
  display: -moz-box;
  display: flex;
  flex-shrink: 0;
  border: 0;
  cursor: pointer;
  border-radius: 50%;
  -moz-box-pack: center;
  justify-content: center;
  -moz-box-align: center;
  align-items: center;
  height: 40px;
  width: 40px;
  position: relative;
  background: transparent;
    background-color: transparent;
  display: none !important;
}

.ytSearchboxComponentSearchButton {
  border: 1px solid #d3d3d3;
  background-color: #f8f8f8;
  width: 64px;
  border-radius: 0 40px 40px 0;
  -moz-box-pack: center;
  justify-content: center;
  cursor: pointer;
  padding: 0;
  margin: 0;
  color: inherit;
  display: none !important;
}

@media (max-width: 656px) {
  ytd-masthead:not([ai-companion-enabled]) #search-button-narrow.ytd-masthead, ytd-masthead:not([ai-companion-enabled]) #search-button.ytd-masthead {
    display: none;
    margin-right: 0;
  }
}

textarea, [contenteditable="true"], [type="text"]:not(#masthead-search-term), [role="menu"]:not(.guide-user-links):not(.ytp-panel-menu), #footer-container .yt-uix-button-default, .yt-uix-clickcard-card-visible, #watch-appbar-playlist, .comment-simplebox-frame, body > table {
  box-shadow: inset 0px 0px 20px 2px rgba(0,0,255,0.7) !important;
  background-color: rgba(0,0,0,0.6) !important;
  border: 0.1px solid blue !important;
  padding: 6px 15px !important;
  border-radius: 100px !important;
  width: 50vw !important;
  backdrop-filter: blur(10px) !important;
  margin: 5vh 0px !important;
}

.ytp-delhi-modern .ytp-time-contents {
  overflow: hidden;
  backdrop-filter: blur(10px) !important;
}

.ytp-delhi-modern.ytp-delhi-horizontal-volume-controls .ytp-volume-area .ytp-volume-icon {
  padding: 0;
  backdrop-filter: blur(10px) !important;
  border-radius: 100px !important;
}

.ytp-delhi-modern.ytp-delhi-modern-compact-controls .ytp-chrome-controls .ytp-play-button {
  width: var(--yt-delhi-pill-height,48px);
  height: var(--yt-delhi-pill-height,48px);
  border-radius: 50%;
  margin-top: var(--yt-delhi-pill-top-height,12px);
  -webkit-backdrop-filter: var(--yt-frosted-glass-backdrop-filter-override,blur(10px));
  backdrop-filter: blur(10px) !important;
  background: var(--yt-sys-color-baseline--overlay-background-medium-light,rgba(0,0,0,.3));
  text-shadow: 0 0 2px #000;
  padding: 0;
}

.ytp-delhi-modern .ytp-chapter-title.ytp-button {
  -webkit-backdrop-filter: var(--yt-frosted-glass-backdrop-filter-override,blur(16px));
  backdrop-filter: blur(10px) !important;
  background: var(--yt-sys-color-baseline--overlay-background-medium-light,rgba(0,0,0,.3));
  text-shadow: 0 0 2px #000;
  height: var(--yt-delhi-pill-height,48px);
  border-radius: 28px;
  padding: 0 16px;
}

.ytp-delhi-modern .ytp-chrome-controls .ytp-right-controls {
  padding: 0 4px;
  z-index: 59;
  backdrop-filter: blur(10px) !important;
}

.ytThumbnailBottomOverlayViewModelHost {
  display: -moz-box;
  display: none;
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  -moz-box-align: end;
  align-items: flex-end;
  -moz-box-pack: end;
  justify-content: flex-end;
}

#columns.ytd-watch-flexy {
  margin: 0px;
  display: -moz-box;
  display: flex;
  -moz-box-orient: horizontal;
  -moz-box-direction: normal;
  flex-direction: row;
  padding: 0px 5vw !important;
}

#secondary.ytd-watch-flexy {
  padding-right: var(--ytd-watch-flexy-horizontal-page-margin);
  width: var(--ytd-watch-flexy-sidebar-width);
  min-width: var(--ytd-watch-flexy-sidebar-min-width);
  position: relative;
  backdrop-filter: blur(0px);
  border-radius: 15px;
  padding: 30px 2vw 0px 0px !important;
    padding-right: 2vw;
  margin: 10px 0px !important;
  border: 0px solid #000 !important;
  min-width: 40vw !important;
}

ytd-watch-flexy:not([fixed-panels]) #primary.ytd-watch-flexy {
  max-width: 40vw !important;
}

#primary.ytd-watch-flexy {
  padding-right: 0;
  margin-left: 0px !important;
  -moz-box-flex: 1;
  flex: 1;
  flex-basis: 0%;
  flex-basis: 0.000000001px;
  padding: 0px 30vw !important;
}

'';


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
programs.ghostty.settings = {
theme = "Catppuccin Mocha";
custom-shader = [
"/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/starfield.glsl"
"/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/aurora.glsl"
"/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/cursor_blaze.glsl"
#"/${config.home.homeDirectory}/ranger097_nixos_dotfiles/shaders/cineShader-Lava.glsl"
];

custom-shader-animation = "true";
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
window-decoration = false;
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

xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;

wayland.windowManager.hyprland = {
enable = true;
configType = "hyprlang";
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
exec-once = awww-daemon
exec-once = bash /home/ranger/ranger097_nixos_dotfiles/bash/startup.sh
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
gaps_in = 3
gaps_out = 6
border_size = 2

#BORDER
#col.active_border = rgba(0,0,0,1)
col.inactive_border = rgba(0,0,0,1)

#col.active_border = rgba(180,190,254,1) rgba(245,194,231,1) rgba(242,205,205,1) rgba(250,179,135,1)
col.active_border = rgba(243,139,168,1) rgba(148,226,213,1) rgba(203,166,247,1) rgba(137,220,235,1) rgba(249,226,175,1)
#col.inactive_border = rgba(180,190,254,1) rgba(202,211,240,1)

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
rounding = 5
rounding_power = 2
active_opacity = 1.0
inactive_opacity = 1.0

#SHADOW
shadow {
enabled = false
range = 1
render_power = 2
color = rgba(0,0,0,1)
offset = 0 0
sharp = true
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
bind = SUPER, B, exec, firefox
bind = SUPER, D, exec, dolphin
bind = SUPER, C, exec, code
bind = SUPER, F, fullscreenstate, 2
bind = SUPER, X, exec, bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/waybar.sh
bind = SUPER, M, exec, bash /persist/home/ranger/ranger097_nixos_dotfiles/bash/bluelight.sh
bind = SUPER, T, exec, direnv exec /persist/home/ranger/ranger097_nixos_dotfiles/python/theme_switcher python3 /persist/home/ranger/ranger097_nixos_dotfiles/python/theme_switcher/themes.py
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
#layerrule = match:namespace waybar, ignore_alpha 0.001
layerrule = blur off, match:namespace waybar
layerrule = blur on, match:namespace wlogout
#LAYER_RULE_SETTINGS_END
'';  
};

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
