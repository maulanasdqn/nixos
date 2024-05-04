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
    vscode
    slack
    xclip
    unzip
    unrar
    brave
    discord
    google-chrome
    spotify
    mysql-workbench
    gparted
    neofetch
    zoom-us
    dmenu
    figma-linux
    pavucontrol
    obs-studio
    pcmanfm
    mpv
    davinci-resolve
    pcsx2
    gcc
    distrobox
    stdenv.cc.cc.lib
    openssl
    dbeaver
    prettierd
  ];
}
