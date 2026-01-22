let
  settings = import ../settings.nix;
in {
  programs.kitty = {
    enable = true;
    settings = {
      font_size = 9.0;
      font_family = "Souce Code Pro";
      adjust_line_height = "100%";
      box_drawing_scale = "0.001, 0.5, 1, 1.75";
      window_padding_width = 3;
      background_opacity = settings.style.opacity;
      allow_remote_control = "yes";
      # scrolling_lines = 1500;
      url_color = settings.color.primary;
      url_style = "curly";
      open_url_with = "default";
      detect_urls = "yes";
      copy_on_select = "yes";
      shell = "fish";
      background = settings.color.background;
      foreground = settings.color.foreground;
      cursor = settings.color.whiteLight;
      selection_foreground = settings.color.white;
      selection_background = settings.color.primary;
      color0 = settings.color.background;
      color8 = settings.color.whiteLight;
      color1 = settings.color.red;
      color9 = settings.color.redLight;
      color2 = settings.color.green;
      color10 = settings.color.greenLight;
      color3 = settings.color.yellow;
      color11 = settings.color.yellowLight;
      color4 = settings.color.yellowLight;
      color12 = settings.color.yellowLight;
      color5 = settings.color.violet;
      color13 = settings.color.violetLight;
      color6 = settings.color.aqua;
      color14 = settings.color.aquaLight;
      color7 = settings.color.white;
      color15 = settings.color.whiteLight;
    };
    keybindings = {
      "ctrl+y" = "copy_to_clipboard";
      "ctrl+p" = "paste_from_clipboard";
    };
  };
}
