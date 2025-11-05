{pkgs, ...}: {
  programs.ranger = {
    enable = true;

    settings = {
      preview_images = true;
      preview_images_method = "kitty";
      show_hidden = false;
    };

    extraConfig = ''
      # General
      set draw_borders true
      set show_hidden false

      # Image previews in Kitty
      set preview_images true
      set preview_images_method kitty

      # Keybindings
      map E extract
      map C compress
    '';

    extraConfigFiles = {
      "scope.sh".source = "${pkgs.ranger}/share/doc/ranger/config/scope.sh";
    };
  };

  home.packages = with pkgs; [
    zip
    unzip
    p7zip
    tar
    gzip
    bzip2
    file
    ffmpegthumbnailer # for video thumbnails in preview
    imagemagick # for image previews (used by scope.sh)
  ];
}
