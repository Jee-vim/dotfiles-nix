{pkgs, ...}: {
  # Graphics drivers for Intel GPU (HD Graphics 620)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # VAAPI driver for Intel GPUs
      mesa
      # intel-ucode       # CPU microcode updates
    ];
  };
}
