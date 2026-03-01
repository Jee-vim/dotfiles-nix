let
  settings = import ../settings.nix;
in {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = ["custom/cat-1" "custom/cat-2"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["network#vpn" "network" "battery" "pulseaudio" "clock"];

        "hyprland/window" = {
          format = "{}";
          max-length = 35;
          rewrite = {
            "" = "Harsh";
          };
          separate-outputs = true;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = " ";
            "2" = "󰄻 ";
            "3" = " ";
            "4" = " ";
            "5" = " ";
            urgent = " ";
            focused = "󰼀 ";
            default = " ";
          };
          sort-by-number = true;
          persistent-workspaces = {
            "*" = 9;
            "DP-1" = 9;
          };
        };

        "custom/cat-1" = {
          format = "  ";
          tooltip-format = "Miawww";
        };
        "custom/cat-2" = {
          format = "  ";
          tooltip-format = "Rawrrr";
        };

        clock = {
          format = "{:%d %B, %H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            weeks-pos = "right";
            format = {
              months = "<span color='${settings.color.orangeLight}'><b>{}</b></span>";
              days = "<span color='${settings.color.foreground}'><b>{}</b></span>";
              weeks = "<span color='${settings.color.yellowLight}'><b>W{}</b></span>";
              weekdays = "<span color='${settings.color.redLight}'><b>{}</b></span>";
              today = "<span color='${settings.color.primary}'><b><u>{}</u></b></span>";
            };
          };
        };

        "network#vpn" = {
          interface = "wg0";
          format = "󰌆 ";
          format-disconnected = "󰌆 ";
          tooltip-format-ethernet = "VPN: {ifname} Connected";
          tooltip-format-disconnected = "VPN: Disconnected";
          on-click = "nmcli connection up wg0"; # Adjust if your connection name differs
          on-click-right = "nmcli connection down wg0";
        };
        network = {
          format-wifi = "󰤨 ";
          format-ethernet = "󰈀 ";
          format-disconnected = " ";

          tooltip-format = "{essid} ({signalStrength}%)\nIP: {ipaddr}\n󰇚 {bandwidthDownBytes} 󰕒 {bandwidthUpBytes}";

          on-click = "nmcli device disconnect wlps0";
          on-click-right = "kitty -e nmtui";
        };

        battery = {
          format-charging = "󱐋 {icon}";
          format = "{icon}";
          tooltip-format = "Capacity: {capacity}%\nTime: {time}\nHealth: {health}%";
          format-icons = [" " " " " " " " " "];
          "states" = {
            "warning" = 30;
            "critical" = 20;
          };
          "events" = {
            "on-discharging-warning" = "notify-send -u normal 'Low Battery'";
            "on-discharging-critical" = "notify-send -u critical 'Very Low Battery'";
            "on-charging-100" = "notify-send -u normal 'Battery Full!'";
          };
        };

        pulseaudio = {
          format = "{icon}";
          tooltip-format = "{volume}%";
          format-bluetooth = "{icon}";
          format-muted = "󰝟 ";
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [
              ""
              " "
              " "
            ];
          };
        };
      };
    };

    style = ''
      * {
        font-family: mono;
        font-size: 14px;
      }
      window#waybar {
          background: ${settings.color.background};
          color: ${settings.color.foreground};
      }

      #clock {
        font-weight: 600;
      }
      #network.vpn {
          color: ${settings.color.foreground};
      }

      #network.vpn.disconnected {
          color: ${settings.color.backgroundLight};
      }

      #network, #battery, #clock, #pulseaudio {
        padding: 0 10px;
      }

      #custom-cat-1,#custom-cat-2 {
        padding: 0 10px;
        background-position: center;
        background-repeat: no-repeat;
      }
      #custom-cat-1 {
        min-width: 50px;
        background-image: url("${settings.dotfilesPath}/home/waybar/bongo-1.png");
        margin-bottom: -11px;
        background-size: cover;
      }
      #custom-cat-2 {
        min-width: 50px;
        background-image: url("${settings.dotfilesPath}/home/waybar/bongo-2.png");
        background-size: contain;
        margin-bottom: -1px;
      }
      tooltip {
          background: ${settings.color.background};
          border-radius: ${settings.style.radius};
          border-width: 1px;
          border-style: solid;
          border-color: ${settings.color.primary};
          padding-right: 5px;
          padding-left: 5px;
          padding-top: 5px;
          padding-bottom: 5px;
      }

      #workspaces button:hover {
          background: transparent;
          box-shadow: inherit; /* Prevents default GTK button shadows */
          text-shadow: inherit;
          border-width: 0px;
      }

      #workspaces button {
          color: ${settings.color.backgroundLight};
          margin-right: 5px;
          padding-right: 0px;
          padding-left: 0px;
      }

      #workspaces button.persistent {
          color:  ${settings.color.foreground};
      }

      #workspaces button.visible {
          color: ${settings.color.primary};
      }

      #workspaces button.empty {
          color: ${settings.color.backgroundLight};
      }

      #workspaces button.urgent {
          color: ${settings.color.redLight};
      }
    '';
  };
}
