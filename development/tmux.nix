{ config, pkgs, lib, ... }:{

programs.tmux = {
  enable = true;
  extraConfig = ''
    set -g status-style bg=default,fg=colour245
    set -g pane-border-style fg=colour235
    set -g pane-active-border-style fg=colour245
  '';
};

}
