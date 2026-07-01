rec {
  user = {
    name = "Jee";
    username = "jee";
  };

  homeDir = "/home/jee";
  dotfilesPath = "${homeDir}/.dotfiles";

  monitor = {
    internal = "eDP-1";
    external = "HDMI-A-1";
  };

  image ={
    internal= "/home/jee/Wallpaper/gruvbox-layer.png";
    external= "/home/jee/Wallpaper/gruvbox-layer.png";
  };

  style = {
    rounded = "0";
    radius = "0px";
    opacity = 1.75;
  };

  start_page = "${dotfilesPath}/home/blank-page.html";

  color = {
    backgroundRgb = "rgba(40, 40, 40, 0.9)";
    background = "#1d2021";
    backgroundLight = "#3c3836";
    foreground = "#ebdbb2";
    primary = "#4c7766";
    primaryHypr = "8ec07c";
    secondaryHypr = "1d2021";

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
