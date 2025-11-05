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

      # Image previews in Kitty
      set preview_images true
      set preview_images_method kitty
    '';
  };

  home.packages = with pkgs; [
    ffmpegthumbnailer # for video thumbnails in preview
    imagemagick # for image previews (used by scope.sh)
  ];
}
