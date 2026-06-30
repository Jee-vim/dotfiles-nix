{pkgs, ...}: {
  # confirm installation
  # find $(nix build nixpkgs#volantes-cursors --no-link --print-out-paths)/share/icons -maxdepth 1
  # or ls $(nix eval --raw nixpkgs#volantes-cursors)/share/icons
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.pointerCursor = {
    name = "volantes_cursors";
    package = pkgs.volantes-cursors;
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
  };

  home.packages = with pkgs; [
    gtk-engine-murrine
  ];
}
