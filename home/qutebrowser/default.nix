{
  config,
  pkgs,
  ...
}: let
  sett = import ../settings.nix;
in {
  programs.qutebrowser = {
    enable = true;
    settings = {
      url.start_pages = [sett.start_page];
      url.default_page = sett.start_page;
    };

    # Inject your config.py directly
    extraConfig = ''
      config.load_autoconfig()

      config.set("colors.webpage.darkmode.enabled", True)
      config.set("colors.webpage.darkmode.policy.images", "smart")
      config.set("colors.webpage.darkmode.policy.page", "smart")

      config.set('auto_save.session', True)
      config.set('content.user_stylesheets', ['~/.dotfiles/home/qutebrowser/style.css'])
      config.bind('<Alt-r>', 'config-source')

      config.set("content.autoplay", False)
      config.set("content.cookies.accept", "no-3rdparty")
      config.set("content.canvas_reading", False)
      config.set("content.geolocation", False)
      config.set("content.media.audio_capture", False)
      config.set("content.media.video_capture", False)
      config.set("content.notifications.enabled", False)

      config.bind('<Alt-j>', 'tab-next')
      config.bind('<Alt-k>', 'tab-prev')

      c.statusbar.show = 'never'
      c.scrolling.bar = "never"
      c.tabs.show = 'never'
      c.tabs.position = 'left'
      c.scrolling.smooth = True

      c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?ia=web&q={}',
        '!go':     'https://www.google.com/search?q={}',
        '!gh':     'https://github.com/search?q={}',
        "!nix": "https://search.nixos.org/packages?query={}",
        "!yt": "https://www.youtube.com/results?search_query={}",
        "!r": "https://reddit.com/r/{}",

        # Dorking
        "!intitle": "https://www.google.com/search?q=intitle%3A\"{}\"",
        "!inurl": "https://www.google.com/search?q=inurl%3A\"{}\"",
        "!intext": "https://www.google.com/search?q=intext%3A\"{}\"",
        "!filetype": "https://www.google.com/search?q=filetype%3A{}",
        "!site": "https://www.google.com/search?q=site%3A{}",
        "!cache": "https://www.google.com/search?q=cache%3A{}",
        "!ext": "https://www.google.com/search?q=ext%3A{}",
        "!indexof": "https://www.google.com/search?q=intitle%3A%22index+of%22+{}",
      }

      c.colors.completion.fg = "${sett.color.foreground}"
      c.colors.completion.odd.bg = "${sett.color.backgroundAlt}"
      c.colors.completion.even.bg = "${sett.color.background}"
      c.colors.statusbar.normal.bg = "${sett.color.backgroundAlt}"
      c.colors.statusbar.normal.fg = "${sett.color.foreground}"
      c.colors.statusbar.insert.bg = "${sett.color.aqua}"
      c.colors.statusbar.insert.fg = "${sett.color.backgroundAlt}"
      c.colors.tabs.bar.bg = "${sett.color.backgroundAlt}"
      c.colors.tabs.selected.odd.bg = "${sett.color.aqua}"

      c.content.blocking.method = 'adblock'
      c.content.blocking.adblock.lists = [
        'https://easylist.to/easylist/easylist.txt'
        'https://easylist.to/easylist/easyprivacy.txt'
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt"
        "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/youtube.txt"
      ]
    '';
  };
}
