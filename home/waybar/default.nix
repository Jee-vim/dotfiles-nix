let
  settings = import ../settings.nix;
in {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        width = 34;
        spacing = 0;
        fixed-center = true;

        modules-left = ["hyprland/workspaces"];
        modules-right = ["network#vpn" "network" "pulseaudio" "battery" "clock"];

        "hyprland/workspaces" = {
          format = "<b>{id}</b>";
          on-click = "activate";
          all-outputs = true;
          sort-by-number = true;

          format-icons = {};
        };

        clock = {
          format = "{:%H\n%M}";
          tooltip-format = "{:%d %B, %H:%M}";
        };

        "network#vpn" = {
          interface = "wg0";
          format = "󰌆 ";
          format-disconnected = "";
          tooltip-format = "VPN: {ifname}";
          on-click = "nmcli connection up wg0";
          on-click-right = "nmcli connection down wg0";
        };

        network = {
          format-wifi = "󰤨 ";
          format-ethernet = "󰈀 ";
          format-disconnected = "󰤮 ";
          tooltip-format = "{essid}\n󰇚 {bandwidthDownBytes} 󰕒 {bandwidthUpBytes}";
          on-click-right = "kitty -e nmtui";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "󱐋";
          format-icons = [" " " " " " " " " "];
          tooltip-format = "{capacity}% - {timeTo}";
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "󰝟 ";
          format-icons = {
            headphone = " ";
            default = ["" " " " "];
          };
          on-click = "pavucontrol";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background: rgba(0, 0, 0, 0); /* Transparent background for floating look */
      }

      /* Main Container Style */
      .modules-left, .modules-right {
        background: ${settings.color.background};
        border: 1px solid ${settings.color.backgroundLight};
        border-radius: 10px;
        margin: 5px 2px;
        padding: 5px 0px;
      }

      #workspaces button {
        padding: 10px 0;
        margin: 2px 0;
        font-weight: 800;
        font-size: 15px;
        color: ${settings.color.foreground};
        transition: all 0.2s ease-in-out;
      }

      #workspaces button.active {
        color: ${settings.color.primary};
        border-left: 3px solid ${settings.color.primary};
      }

      #workspaces button.urgent {
        color: ${settings.color.redLight};
      }

      #workspaces button:hover {
        color: ${settings.color.primary};
        border-left: 3px solid ${settings.color.primary};
      }

      /* Individual Module Styling */
      #clock, #network, #battery, #pulseaudio, #vpn {
        color: ${settings.color.foreground};
        padding: 8px 0;
        margin: 0 4px;
      }

      #battery.critical:not(.charging) {
        color: ${settings.color.redLight};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
        to {
          background-color: ${settings.color.redLight};
          color: ${settings.color.foreground};
        }
      }

      tooltip {
        background: ${settings.color.background};
        border: 1px solid ${settings.color.primary};
        border-radius: 8px;
      }
    '';
  };
}
