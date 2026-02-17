{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.sauce-code-pro
      nerd-fonts.geist-mono
      nerd-fonts.commit-mono
      nerd-fonts.iosevka
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["JetBrainszMono Nerd Font"];
        sansSerif = ["JetBrainszMono Nerd Font"];
        monospace = ["JetBrainszMono Nerd Font"];
      };
    };
  };
}
