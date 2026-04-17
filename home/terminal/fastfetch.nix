{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ./ascii.txt;
        type = "file";
        height = 12;
        width = 10;
      };
      modules = [
        # Header
        "title"
        "separator"

        # System Info
        {
          type = "os";
          key = " ";
        }
        # {
        #   type = "host";
        #   key = " ";
        # }
        {
          type = "kernel";
          key = " ";
        }
        {
          type = "packages";
          key = "󰮯 ";
        }

        # Desktop Environment
        {
          type = "wm";
          key = " ";
        }

        # Shell/Terminal
        {
          type = "terminal";
          key = " ";
        }

        # Hardware
        # { type = "display"; key = "DSP"; }
        # { type = "cpu"; key = "CPU"; }
        # { type = "gpu"; key = "GPU"; }
        {
          type = "disk";
          key = " ";
        }
        {
          type = "battery";
          key = " ";
        }
      ];
    };
  };
}
