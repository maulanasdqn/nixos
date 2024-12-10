{pkgs, ...}: {
  home.packages = with pkgs; [
    postman
    networkmanagerapplet
    nodejs
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
    lsof
    discord
    lua
    microsoft-edge
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
    openssl
    prettierd
    blueman
    zip
    swaybg
    wlsunset
    wl-clipboard
    fzf
    brightnessctl
    alsa-utils
    nodePackages.yarn
  ];
}
