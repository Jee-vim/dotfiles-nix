{
  config,
  pkgs,
  ...
}: let
  colors = import ../settings.nix;
in {
  programs.qutebrowser = {
    enable = true;

    # Inject your config.py directly
    extraConfig = ''
      config.load_autoconfig()

      config.set("colors.webpage.darkmode.enabled", True)
      config.set("colors.webpage.darkmode.policy.images", "smart")
      config.set("colors.webpage.darkmode.policy.page", "smart")

      c.colors.completion.fg = "${colors.foreground}"
      c.colors.completion.odd.bg = "${colors.backgroundAlt}"
      c.colors.completion.even.bg = "${colors.background}"
      c.colors.statusbar.normal.bg = "${colors.backgroundAlt}"
      c.colors.statusbar.normal.fg = "${colors.foreground}"
      c.colors.statusbar.insert.bg = "${colors.aqua}"
      c.colors.statusbar.insert.fg = "${colors.backgroundAlt}"
      c.colors.tabs.bar.bg = "${colors.backgroundAlt}"
      c.colors.tabs.selected.odd.bg = "${colors.aqua}"
    '';
  };
}
