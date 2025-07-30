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

      config.bind('<Alt-j>', 'tab-next')
      config.bind('<Alt-k>', 'tab-prev')

      c.tabs.show = 'never' # hide tab
      c.tabs.position = 'left'
      c.scrolling.smooth = True
      c.content.geolocation = False  # Disable geolocation requests

      c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?ia=web&q={}',
        '!go':     'https://www.google.com/search?q={}',
        '!gh':     'https://github.com/search?q={}'
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
        'https://adblockfilters.com/abp.filters.txt'
      ]
    '';
  };
}
