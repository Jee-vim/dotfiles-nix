let
  settings = import ../settings.nix;
in {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 44;
        spacing = 0;
        fixed-center = true;

        modules-center = ["hyprland/workspaces" "cava" "temperature" "cpu" "memory" "network#vpn" "network" "battery" "clock"];

        "hyprland/workspaces" = {
          format = "<b>{id}</b>";
          on-click = "activate";
          all-outputs = true;
          sort-by-number = true;

          format-icons = {};
        };

        cava = {
          bars = 12;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          format = "│{}│";
          bar_delimiter = 0;
          sleep_timer = 1;
          hide_on_silence = true;
        };

        clock = {
          format = "<b>{:%H:%M}</b>";
          tooltip-format = "{:%d %B}";
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
          format-ethernet = " ";
          format-disconnected = "󰤭 ";
          tooltip-format = "{essid}\n {bandwidthUpBytes}\n {bandwidthDownBytes}";
          on-click = "nmcli device disconnect wlp2s0";
          on-click-middle = "nmcli device connect wlp2s0";
          on-click-right = "kitty -e nmtui connect";
        };

        battery = {
          states = {
            critical = 20;
          };
          format = "";
          format-critical = " {capacity}%";
          format-charging = "󱐋 {capacity}%";
          format-icons = [" " " " " " " " " "];
          tooltip-format = "{capacity}% - {timeTo}";
        };
        temperature = {
          critical-threshold = 80;
          format = "";
          format-critical = "";
        };
        cpu = {
          format = "";
          format-medium = " ";
          format-high = " ";
          on-click = "kitty -e btop";
          states = {
            medium = 30;
            high = 80;
          };
        };
        memory = {
          format = "";
          format-medium = " ";
          format-high = " ";
          on-click = "kitty -e btop";
          states = {
            medium = 50;
            high = 85;
          };
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
      .modules-center {
        background: ${settings.color.background};
        border: 1px solid ${settings.color.backgroundLight};
        border-radius: 8px;
        margin: 4px 8px;
        padding: 4px;
      }

      /* Workspace buttons - horizontal layout */
      #workspaces {
        min-width: 0;
        margin-right: 4px;
      }

      #workspaces button {
        padding: 2px 4px;
        margin: 0 1px;
        font-weight: 800;
        color: ${settings.color.foreground};
        transition: all 0.2s ease-in-out;
        border-radius: 4px;
      }

      #workspaces button.active, #workspaces button:hover {
        color: ${settings.color.background};
        background: ${settings.color.foreground};
        padding: 2px 10px;
      }

      #workspaces button.urgent {
        color: ${settings.color.redLight};
      }

      /* Individual Module Styling - horizontal padding */
      #clock, #network, #battery, #vpn, #cava, #cpu, #memory, #temperature {
        color: ${settings.color.foreground};
        padding: 2px 4px;
        margin: 0 2px;
      }

      #cpu.medium, #memory.medium {
        color: ${settings.color.yellowLight};
      }

      #cpu.high, #memory.high, #temperature.critical {
        color: ${settings.color.redLight};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #cava.empty, #cpu.empty, #memory.empty, #temperature.empty, #battery.empty {
          padding: 0;
          margin: 0;
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
        color: ${settings.color.foreground};
        border: 1px solid ${settings.color.backgroundLight};
        border-radius: 8px;
      }
    '';
  };
}
