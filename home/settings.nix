{
  user = {
    name = "Jee";
    username = "jee";
  };

  monitor = {
    internal = "eDP-1";
    external = "HDMI-A-1";
  };

  style = {
    rounded = "0";
    radius = "0px";
    opacity = 1.75;
  };

  image = {
    internal = "/home/jee/Wallpaper/gruvbox-village.jpg";
    external = "/home/jee/Wallpaper/tanjiro-kamado-gruv.jpg";
    lockscreen = "/home/jee/Wallpaper/gruvbox-village.jpg";
    profile = "/home/jee/Wallpaper/gruvbox-village.jpg";
  };

  start_page = "/home/jee/.dotfiles/home/blank-page.html";

  script = {
    greetings = "bash /home/jee/.dotfiles/home/hyprland/script/greeting.sh";
    battery = "bash /home/jee/.dotfiles/home/hyprland/script/battery.sh";
    powermenu = "/home/jee/.dotfiles/home/rofi/script/powermenu.sh";
    network = "/home/jee/.dotfiles/home/rofi/script/network.sh";
    monitorAssign = "/home/jee/.dotfiles/home/hyprland/script/monitor-assign.sh";
    volume = "/home/jee/.dotfiles/home/hyprland/script/volume.sh";
    brightness = "/home/jee/.dotfiles/home/hyprland/script/brightness.sh";
  };

  color = {
    backgroundRgb = "rgba(40, 40, 40, 0.9)";
    backgroundRgbAlt = "rgba(29, 32, 33, 0.9)";
    background = "#282828";
    backgroundAlt = "#1d2021";
    foreground = "#ebdbb2";
    primary = "#4c7766";

    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    violet = "#b16286";
    aqua = "#689d6a";
    white = "#a89984";
    blue = "#458588";
    orange = "#d65d0e";

    redLight = "#fb4934";
    greenLight = "#b8bb26";
    yellowLight = "#fabd2d";
    violetLight = "#d3869b";
    aquaLight = "#8ec07c";
    whiteLight = "#928374";
    blueLight = "#83a598";
    orangeLight = "#fe8019";
  };
}
