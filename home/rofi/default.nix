{
  pkgs,
  config,
  ...
}: let
  settings = import ../settings.nix;
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
    font = "Fira Mono 10";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        background = mkLiteral settings.color.background;
        background-alt = mkLiteral settings.color.backgroundAlt;
        foreground = mkLiteral settings.color.foreground;
        foreground-alt = mkLiteral settings.color.foreground;
        primary = mkLiteral settings.color.primary;

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        accent-color = mkLiteral "@foreground";

        radius = mkLiteral settings.style.radius;
        margin = 0;
        padding = 0;
        spacing = 0;
        border = 0;

        width = mkLiteral "750px";
        height = mkLiteral "300px";
      };
      window = {
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
        border = mkLiteral "2px";
        border-color = mkLiteral "@foreground";
        border-radius = mkLiteral "@radius";
        transparency = "real";
      };
      mainbox = {
        orientation = mkLiteral "horizontal";
        children = mkLiteral "[imagebox, listview]";
      };
      imagebox = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "transparent";
        background-image = mkLiteral "url('/home/jee/Wallpaper/gruvbox-village.jpg', height)";
        orientation = mkLiteral "vertical";
        children = mkLiteral "[inputbar, mode-switcher]";
      };
      inputbar = {
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background-alt";
        padding = mkLiteral "10px 8px";
        spacing = mkLiteral "8px";
        border-radius = mkLiteral "@radius";
        children = mkLiteral "[prompt, entry]";
      };
      prompt = {
        text-color = mkLiteral "@foreground";
      };
      entry = {
        text-color = mkLiteral "@foreground-alt";
      };
      listview = {
        lines = 8;
        cycle = true;
        dynamic = true;
        layout = mkLiteral "vertical";
        fixed-height = true;
        fixed-columns = true;
        scrollbar = true;
      };
      scrollbar = {
        background-color = mkLiteral "@background-alt";
        handle-color = mkLiteral "@primary";
        margin-left = mkLiteral "6px";
        handle-width = mkLiteral "5px";
      };
      element = {
        text-color = mkLiteral "@foreground";
        padding = mkLiteral "6px 8px";
        spacing = mkLiteral "8px";
        children = mkLiteral "[element-text]";
        cursor = mkLiteral "pointer";
      };
      "element selected" = {
        text-color = mkLiteral "@foreground-alt";
        background-color = mkLiteral "@primary";
        cursor = mkLiteral "pointer";
      };
      element-text = {
        text-color = mkLiteral "inherit";
      };
      mode-switcher = {
        border-radius = mkLiteral "@radius";
        text-color = "inherit";
        background-color = "transparent";
        margin = mkLiteral "5px 0 5px 0";
        spacing = mkLiteral "5px";
      };
      button = {
        padding = mkLiteral "15px";
        border-radius = mkLiteral "@radius";
        background-color = mkLiteral "@primary";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };
      "button selected" = {
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
      };
    };
    extraConfig = {
      # show-icons = true;
      terminal = "kitty";
      modi = "drun,run,window,filebrowser";
      show-icons = false;
      display-drun = "󰀻 ";
      display-run = "󰆍 ";
      display-window = " ";
      display-filebrowser = " ";
      display-power = "󰐥 ";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
    };
  };
}
