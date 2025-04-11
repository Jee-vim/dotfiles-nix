{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = "none";
      modules = [
        # Header
        "title"
        "separator"

        # System Info
        {
          type = "os";
          key = "OS ";
        }
        {
          type = "host";
          key = "HST";
        }
        {
          type = "kernel";
          key = "KRN";
        }
        {
          type = "packages";
          key = "PKG";
        }

        # Desktop Environment
        {
          type = "de";
          key = "DE ";
        }
        {
          type = "wm";
          key = "WM ";
        }

        # Shell/Terminal
        {
          type = "shell";
          key = "SH ";
        }
        {
          type = "terminal";
          key = "TER";
        }

        # Hardware
        # { type = "display"; key = "DSP"; }
        # { type = "cpu"; key = "CPU"; }
        # { type = "gpu"; key = "GPU"; }
        {
          type = "memory";
          key = "RAM";
        }
        {
          type = "swap";
          key = "SWP";
        }
        {
          type = "disk";
          key = "DSK";
        }
        {
          type = "battery";
          key = "BAT";
        }
      ];
    };
  };
}
