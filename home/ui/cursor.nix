{pkgs, ...}: {
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 18;
    gtk.enable = true;
    x11.enable = true;
  };
}
