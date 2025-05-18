let
  settings = import ../../settings.nix;
in {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"

      "float, class:^(blueman-manager)$"
      "float, class:^(com.saivert.pwvucontrol)$"
      "float, class:^(io.bassi.Amberol)$"
      "float, class:^(io.github.celluloid_player.Celluloid)$"
      "float, class:^(mpv)$"
      "float, class:^(thunar)$"
      "float, class:^(xdg-desktop-portal-gtk)$"

      "float, title:^(File Upload)(.*)$"
      "float, title:^(Library)(.*)$"
      "float, title:^(Open File)(.*)$"
      "float, title:^(Open Folder)(.*)$"
      "float, title:^(Save As)(.*)$"
      "float, title:^(Select a File)(.*)$"

      "float, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"
      "pin, title:^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$"

      "idleinhibit fullscreen, class:^(.*)$"
      "idleinhibit fullscreen, title:^(.*)$"
      "idleinhibit fullscreen, fullscreen:1"

      "suppressevent maximize, class:.*"

      "bordersize 0, floating:0, onworkspace:w[tv1]"
      "rounding 0, floating:0, onworkspace:w[tv1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:f[1]"
      "workspace 1, class:^(brave-browser)$"
      "workspace 2, class:^(postman)$"
      "workspace 3, class:^(org.telegram.desktop)$"
      "workspace 6, class:^(kitty)$"
    ];

    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
      "1, monitor:${settings.monitor.internal}"
      "2, monitor:${settings.monitor.internal}"
      "3, monitor:${settings.monitor.internal}"
      "6, monitor:${settings.monitor.external}"
    ];
  };
}
