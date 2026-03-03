let
  settings = import ../settings.nix;
in {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 0;
        fixed-center = true;

        modules-left = ["hyprland/workspaces"];
        modules-right = ["network#vpn" "network" "battery" "clock"];

        "hyprland/workspaces" = {
          format = "<b>{id}</b>";
          on-click = "activate";
          all-outputs = true;
          sort-by-number = true;

          format-icons = {};
        };

        clock = {
          format = "<b>{:%H:%M}</b>";
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
        background: rgba(0, 0, 0, 0);
      }

      /* Main Container Style - horizontal for top bar */
      .modules-left, .modules-right {
        background: ${settings.color.background};
        border: 1px solid ${settings.color.backgroundLight};
        border-radius: 8px;
        margin: 4px 8px;
        padding: 4px;
      }

      /* Workspace buttons - horizontal layout */
      #workspaces {
        min-width: 0;
      }

      #workspaces button {
        padding: 2px 4px;
        font-weight: 800;
        color: ${settings.color.foreground};
        transition: all 0.2s ease-in-out;
        border-radius: 4px;
      }

      #workspaces button.active,#workspaces button:hover {
        color: ${settings.color.background};
        background: ${settings.color.foreground};
      }

      #workspaces button.urgent {
        color: ${settings.color.redLight};
      }

      /* Individual Module Styling - horizontal padding */
      #clock, #network, #battery, #vpn {
        color: ${settings.color.foreground};
        padding: 2px 4px;
        margin: 0 2px;
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
        border: 1px solid ${settings.color.backgroundLight};
        border-radius: 8px;
      }
    '';
  };
}
