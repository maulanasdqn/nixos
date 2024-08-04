{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    bun
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
    eza
    htop
    fd
    android-tools
    ripgrep
    luajitPackages.lua-lsp
    slack
    xclip
    unzip
    unrar
    brave
    discord
    google-chrome
    spotify
    gparted
    neofetch
    zoom-us
    dmenu
    figma-linux
    pavucontrol
    obs-studio
    pcmanfm
    mpv
    pcsx2
    gcc
    distrobox
    stdenv.cc.cc.lib
    openssl
    prettierd
    blueman
    zip
    swaybg
    wlsunset
    wl-clipboard
  ];
}
