{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.fetchFromGitHub {
        owner = "SylEleuth";
        repo = "gruvbox-plus-icon-pack";
        rev = "144d470";
        sha256 = "1ijal9qjvl9idmka8yq60wdm99svplb9ppf2hd08i1fym75madia";
      };
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
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
    GTK_THEME = "Gruvbox-Dark:dark";
    QT_STYLE_OVERRIDE = "gtk2";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    QT_QPA_PLATFORMTHEME = "gtk2";
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
  };

  home.packages = with pkgs; [
    libsForQt5.qt5ct
    gtk-engine-murrine
    adwaita-icon-theme
  ];
}
