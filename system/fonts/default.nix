{pkgs, ...}: {
  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.enableGhostscriptFonts = true;
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
  ];

  fonts.fontconfig = {
    useEmbeddedBitmaps = true;
    defaultFonts = {
      serif = ["Ubuntu"];
      sansSerif = ["Ubuntu"];
      monospace = ["Hack Nerd Font Mono"];
    };
  };
}
