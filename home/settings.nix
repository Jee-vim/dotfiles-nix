rec {
  user = {
    name = "Jee";
    username = "jee";
  };

  # Centralized home directory - use this instead of hardcoded paths
  homeDir = "/home/jee";
  dotfilesPath = "${homeDir}/.dotfiles";

  monitor = {
    internal = "eDP-1";
    external = "HDMI-A-1";
  };

  style = {
    rounded = "0";
    radius = "0px";
    # rounded = "10";
    # radius = "10px";
    opacity = 1.75;
  };

  image = {
    internal = "${homeDir}/Wallpaper/space-shuttle.png";
    external = "${homeDir}/Wallpaper/space-shuttle.png";
  };

  start_page = "${dotfilesPath}/home/blank-page.html";

  script = {
    powermenu = "${dotfilesPath}/home/script/powermenu.sh";
    volume = "${dotfilesPath}/home/script/volume.sh";
    brightness = "${dotfilesPath}/home/script/brightness.sh";
    screenshot = "${dotfilesPath}/home/script/screenshot.sh";
  };

  color = {
    backgroundRgb = "rgba(40, 40, 40, 0.9)";
    background = "#1d2021";
    backgroundLight = "#3c3836";
    foreground = "#ebdbb2";
    primary = "#4c7766";
    primaryHypr = "8ec07c";
    secondaryHypr = "282828";

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
