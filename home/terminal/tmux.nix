{pkgs, ...}: let
  settings = import ../settings.nix;
in {
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    shortcut = "a";
    shell = "${pkgs.fish}/bin/fish";
    mouse = true;
    keyMode = "vi";
    extraConfig = ''
      # Split windows
      unbind %
      bind | split-window -h

      unbind '"'
      bind - split-window -v

      # Pane navigation
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R

      # Pane resizing
      bind -r h resize-pane -L 5
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5

      # Zoom pane
      bind -r m resize-pane -Z

      # Pane border colors
      set-option -g pane-border-style fg=${settings.color.foreground}
      set-option -ag pane-active-border-style fg=${settings.color.primary}

      # Mode style
      set-option -g mode-style "bg=${settings.color.primary}, fg=${settings.color.background}"

      # Escape time
      set -sg escape-time 7

      # Turn off status line
      set -g status off
    '';
  };
}
