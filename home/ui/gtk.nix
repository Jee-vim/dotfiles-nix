{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      name = "Gruvbox-Dark-B";
      package = pkgs.gruvbox-dark-gtk;
    };

    # Optional: match icons and cursor to the theme
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };
}
