let
  settings = import ../../settings.nix;
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      background = {
        path = "${settings.image.lockscreen}";
        contrast = 0.6;
        blur_passes = 2;
        zindex = 0;
      };

      image = {
        path = "${settings.image.profile}";
        size = 150;
        rounding = -1;
        position = "0, 130";
        halign = "center";
        valign = "bottom";
      };

      input-field = {
        size = "200, 40";
        outline_thickness = 4;
        opacity = 0.8;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(255, 255, 255, 1.0)";
        inner_color = "rgba(235, 235, 235, 1.0)";
        font_color = "rgba(25, 25, 25, 1.0)";
        fade_on_empty = false;
        hide_input = false;
        check_color = "rgba(255, 255, 255, 1.0)";
        fail_color = "rgba(255, 0, 0, 1.0)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        placeholder_text = "<i>Enter The Nuclear Code</i>";
        capslock_color = "rgba(255, 255, 255, 1.0)";
        position = "0, 60";
        halign = "center";
        valign = "bottom";
      };

      label = [
        {
          text = "cmd[update:1000] echo -e \"󰁥 $(uname -n)\\n$(uname -r)\\nPackages: $(nix-env -q | wc -l) nix-env\"";
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 11;
          font_family = "GeistMono Bold";
          position = "20, -20";
          halign = "left";
          valign = "top";
        }
        {
          text = "cmd[update:1000] echo \"$(${settings.script.greetings})\"";
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 11;
          font_family = "GeistMono Bold";
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
        {
          text = "cmd[update:1000] bash -c 'day=$(date +%A); echo \"Today is $day\"'";
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 11;
          font_family = "GeistMono Bold";
          position = "0, -45";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
