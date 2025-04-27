{
  pkgs,
  config,
  ...
}: let
  settings = import ./settings.nix;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    pass = {
      enable = true;
      package = pkgs.rofi-pass-wayland;
      extraConfig = ''
        backend=wtype
        clipboard_backend=wl-clipboard
      '';
    };
    font = "Fira Mono 12";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        # image = mkLiteral settings.image.internal;
        background = mkLiteral settings.color.background;
        background-alt = mkLiteral settings.color.backgroundAlt;
        foreground = mkLiteral settings.color.foreground;
        foreground-alt = mkLiteral settings.color.foreground;
        primary = mkLiteral settings.color.primary;

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        accent-color = mkLiteral "@foreground";

        margin = 0;
        padding = 0;
        spacing = 0;
        border = 0;

        width = mkLiteral "600px";
      };
      window = {
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
        border = mkLiteral "2px";
        border-color = mkLiteral "@primary";
        border-radius = mkLiteral "3px";
        padding = mkLiteral "6px";
        transparency = "real";
      };
      mainbox = {
        children = mkLiteral "[inputbar, mode-switcher, listview]";
      };
      # imagebox = {
      #   padding = mkLiteral "10px";
      #   background-color = mkLiteral "transparent";
      #   background-image = mkLiteral "url(@image, height)";
      #   orientation = "vertical";
      #   children = mkLiteral "[inputbar]";
      # };
      inputbar = {
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
        padding = mkLiteral "8px 8px";
        spacing = mkLiteral "8px";
        children = mkLiteral "[prompt, entry]";
      };
      prompt = {
        text-color = mkLiteral "@foreground";
      };
      entry = {
        text-color = mkLiteral "@foreground-alt";
      };
      listview = {
        lines = 10;
        scrollbar = true;
      };
      scrollbar = {
        background-color = mkLiteral "@background-alt";
        handle-color = mkLiteral "@foreground-alt";
        margin-left = mkLiteral "6px";
        handle-width = mkLiteral "5px";
      };
      element = {
        text-color = mkLiteral "@foreground";
        padding = mkLiteral "6px 8px";
        spacing = mkLiteral "8px";
        children = mkLiteral "[element-text]";
      };
      "element selected" = {
        text-color = mkLiteral "@foreground-alt";
        background-color = mkLiteral "@background-alt";
      };
      element-text = {
        text-color = mkLiteral "inherit";
      };
      mode-switcher = {
        border-radius = mkLiteral "0px";
        text-color = "inherit";
        background-color = "transparent";
        margin = mkLiteral "5px 0 5px 0";
        spacing = mkLiteral "5px";
      };
      button = {
        padding = mkLiteral "15px";
        border-radius = mkLiteral "10px ";
        background-color = mkLiteral "@primary";
        text-color = mkLiteral "@foreground";
        cursor = "pointer";
      };
      buttonselected = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };
    };
    extraConfig = {
      # show-icons = true;
      terminal = "kitty";
      modi = "drun,run,window";
      show-icons = false;
      display-drun = "󰀻 ";
      display-run = "RUN";
      display-window = " ";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
    };
  };
}
