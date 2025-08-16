{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk"; # Uses GTK theme for Qt apps
    style.name = "gtk2"; # Fallback style
  };

  # Better theming support for all apps
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Environment variables for consistency
  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1"; # Better Firefox theming
    GTK_THEME = "Arc-Dark:dark";
    QT_STYLE_OVERRIDE = "gtk2";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    QT_QPA_PLATFORMTHEME = "gtk2";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
  };

  home.packages = with pkgs; [
    libsForQt5.qt5ct
    gtk-engine-murrine # For GTK2 theme support
    pkgs.adwaita-icon-theme # Fallback icons
  ];
}
