{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = ["Ubuntu"];
      sansSerif = ["Ubuntu" "Vazirmatn"];
      monospace = ["Ubuntu Mono"];
    };
  };
}
