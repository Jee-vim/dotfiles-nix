let
  settings = import ../../settings.nix;
in {
  programs.wofi = {
    enable = true;
  };

  xdg.configFile."wofi/config".text = ''
    term=kitty
    location=center
    width=20%
    lines=5

    search=brave
    prompt=Search
    show=drun
    insensitive=true
    # allow_images=true
    hide_scroll=true

    aways_parse_args=false
    show_all=false
  '';

  xdg.configFile."wofi/style.css".text = ''
    window {
      margin: 0px;
      background-color: ${settings.color.background};
      border-radius: ${settings.style.rounded}px;
      height: 10vh;
    }

    #input {
      margin: 5px;
      border: none;
      color: ${settings.color.foreground};
      background-color: ${settings.color.background};
      outline: none;
    }

    #input:focus {
      border: 0.1px solid ${settings.color.primary};
      outline: none;
    }

    #inner-box {
      margin: 5px;
      border: none;
      background-color: ${settings.color.background};
    }

    #outer-box {
      margin: 5px;
      border: none;
      background-color: ${settings.color.background};
    }

    #scroll {
      margin: 0px;
      border: none;
    }

    #text {
      margin: 5px;
      border: none;
      color: ${settings.color.foreground};
    }

    #text:selected {
      color: ${settings.color.foreground};
      background: ${settings.color.primary};
    }

    #entry:selected {
      background-color: ${settings.color.primary};
      border-radius: ${settings.style.rounded}px;
    }
  '';
}
