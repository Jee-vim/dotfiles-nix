let
  settings = import ../../settings.nix;
in {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "center";
      positionY = "top";
      layer = "overlay";
      control-center-margin-top = 10;
      control-center-margin-bottom = 50;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 700;
      control-center-height = 0;
      notification-window-width = 700;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widget-config = {
        title = {
          text = "Notification";
          clear-all-button = true;
          button-text = "󰎟";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 3;
          text = "Notification Center";
        };
        mpris = {
          image-size = 96;
          image-radius = settings.style.rounded;
        };
        volume = {
          label = "󰕾";
        };
        backlight = {
          label = "󰃟";
        };
      };
      widgets = [
        "mpris"
        "volume"
        "backlight"
        "title"
        "dnd"
        "notifications"
      ];
    };
    style = ''
      * {
        font-family: FiraCode;
        font-weight: bold;
      }
      .control-center .notification-row:focus,
      .control-center .notification-row:hover {
        opacity: 0.9;
        background: ${settings.color.background}
      }
      .notification-row {
        outline: none;
        margin: 10px;
        padding: 0;
      }
      .notification {
        background: ${settings.color.background};
        padding: 0;
        margin: 0px;
      }
      .notification-content {
        background: ${settings.color.background};
        padding: 10px;
        border-radius: ${settings.style.rounded}px;
        border: 2px solid ${settings.color.primary};
        margin: 0;
      }
      .notification-default-action {
        margin: 0;
        padding: 0;
        border-radius: ${settings.style.rounded}px;
      }
      .close-button {
        background: ${settings.color.red};
        color: ${settings.color.white};
        text-shadow: none;
        padding: 0;
        border-radius: ${settings.style.rounded}px;
        margin-top: 5px;
        margin-right: 5px;
      }
      .close-button:hover {
        box-shadow: none;
        background: ${settings.color.redLight};
        transition: all .15s ease-in-out;
        border: none
      }
      .notification-action {
        border: 2px solid ${settings.color.primary};
        border-top: none;
        border-radius: ${settings.style.rounded}px;
      }
      .notification-default-action:hover,
      .notification-action:hover {
        color: ${settings.color.white};
        background: ${settings.color.blue}
      }
      .notification-default-action {
        border-radius: ${settings.style.rounded}px;
        margin: 0px;
      }
      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: ${settings.style.rounded}px;
        border-bottom-right-radius: ${settings.style.rounded}px
      }
      .notification-action:first-child {
        border-bottom-left-radius: ${settings.style.rounded}px;
        background: ${settings.color.background}
      }
      .notification-action:last-child {
        border-bottom-right-radius: ${settings.style.rounded}px;
        background: ${settings.color.background}
      }
      .inline-reply {
        margin-top: 8px
      }
      .inline-reply-entry {
        background: ${settings.color.violet};
        color: ${settings.color.yellow};
        caret-color: ${settings.color.yellow};
        border: 1px solid ${settings.color.primary};
        border-radius: ${settings.style.rounded}px
      }
      .inline-reply-button {
        margin-left: 4px;
        background: ${settings.color.background};
        border: 1px solid ${settings.color.primary};
        border-radius: ${settings.style.rounded}px;
        color: ${settings.color.white}
      }
      .inline-reply-button:disabled {
        background: initial;
        color: ${settings.color.yellow};
        border: 1px solid transparent
      }
      .inline-reply-button:hover {
        background: ${settings.color.redLight}
      }
      .body-image {
        margin-top: 6px;
        background-color: ${settings.color.red};
        border-radius: ${settings.style.rounded}px
      }
      .summary {
        font-size: 14px;
        font-weight: 700;
        background: transparent;
        color: ${settings.color.white};
        text-shadow: none
      }
      .time {
        font-size: 12px;
        font-weight: 700;
        background: transparent;
        color: ${settings.color.white};
        text-shadow: none;
        margin-right: 18px
      }
      .body {
        font-size: 14px;
        font-weight: 400;
        background: transparent;
        color: ${settings.color.white};
        text-shadow: none
      }
      .control-center {
        background: ${settings.color.background};
        /* border: 2px solid ${settings.color.yellow}; */
        border-radius: ${settings.style.rounded}px;
      }
      .control-center-list {
        background: ${settings.color.violet}
      }
      .control-center-list-placeholder {
        opacity: .5
      }
      .floating-notifications {
        background: transparent
      }
      .blank-window {
        background: alpha(black, 0)
      }
      .widget-title {
        color: ${settings.color.white};
        background: ${settings.color.background};
        font-size: 1rem;
        border-radius: ${settings.style.rounded}px;
      }
      .widget-title>button {
        font-size: 0.8rem;
        color: ${settings.color.white};
        text-shadow: none;
        background: ${settings.color.backgroundAlt};
        box-shadow: none;
        border-radius: ${settings.style.rounded}px;
      }
      .widget-title>button:hover {
        background: ${settings.color.red};
        color: ${settings.color.background};
      }
      .widget-dnd {
        background: ${settings.color.background};
        border-radius: ${settings.style.rounded}px;
        font-size: 1rem;
        color: ${settings.color.white};
      }
      .widget-dnd>switch {
        border-radius: ${settings.style.rounded}px;
        border: 1px solid ${settings.color.white};
        background: ${settings.color.backgroundAlt};
      }
      .widget-dnd>switch:checked {
        background: ${settings.color.primary};
      }
      .widget-dnd>switch slider {
        background: ${settings.color.white};
        box-shadow: none;
        border-radius: ${settings.style.rounded}px
      }
      .widget-dnd>switch:checked slider {
        background: ${settings.color.white};
        box-shadow: none;
        border-radius: ${settings.style.rounded}px
      }
      .widget-label {
          margin: 0px;
      }
      .widget-label>label {
        font-size: 0.8rem;
        color: ${settings.color.whiteLight};
      }
      .widget-mpris {
        color: ${settings.color.white};
        border-radius: ${settings.style.rounded}px;
        box-shadow: none;
      }
      .widget-mpris > box > button {
        border-radius: ${settings.style.rounded}px;
      }
      .widget-mpris-player {
        padding: 5px;
        margin: 10px
      }
      .widget-mpris-title {
        font-weight: 700;
        font-size: 1.25rem
      }
      .widget-mpris-subtitle {
        font-size: 1.1rem
      }
      .widget-menubar>box>.menu-button-bar>button {
        border: none;
        background: ${settings.color.red}
      }
      .topbar-buttons>button {
        border: none;
        background: transparent
      }
      .widget-volume {
        background: ${settings.color.backgroundAlt};
        padding: 5px;
        border-radius: ${settings.style.rounded}px;
        font-size: x-large;
        color: ${settings.color.white};
      }
      .widget-volume>box>button {
        background: ${settings.color.primary};
        border: none
      }
      .per-app-volume {
        background-color: ${settings.color.background};
        padding: 4px 8px 8px;
        margin: 0 8px 8px;
        border-radius: ${settings.style.rounded}px;
      }
      .widget-backlight {
        background: ${settings.color.backgroundAlt};
        padding: 5px;
        margin: 10px 10px 5px 10px;
        border-radius: ${settings.style.rounded}px;
        font-size: x-large;
        color: ${settings.color.white}
      }
    '';
  };
}
