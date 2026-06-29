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

      # --- Tab Bar Customization ---
      tab_bar_style = "separator";
      tab_separator = "\"\""; # Needs quotes escaped so Nix passes "" to kitty.conf
      tab_bar_min_tabs = 2;
      active_tab_font_style = "bold";
      inactive_tab_font_style = "normal";

      active_tab_foreground = settings.color.background;
      active_tab_background = settings.color.aqua;

      inactive_tab_foreground = settings.color.foreground;
      inactive_tab_background = settings.color.background;

      tab_title_template = "  ({index}) {b:title}  ";
      active_tab_title_template = "  ({index}) {b:title}  ";
    };
    keybindings = {
      "ctrl+y" = "copy_to_clipboard";
      "ctrl+p" = "paste_from_clipboard";

      "ctrl+]" = "next_tab";
      "ctrl+[" = "previous_tab";

      "ctrl+t" = "new_tab";
      "ctrl+q" = "close_tab";

      "ctrl+shift+page_up" = "move_tab_backward";
      "ctrl+shift+page_down" = "move_tab_forward";
    };
  };
}
