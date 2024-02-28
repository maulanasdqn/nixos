{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bun
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    nodePackages.yarn
    eza
    htop
    postgresql
    fd
    android-tools
    rubber
    ripgrep
    luajitPackages.lua-lsp
    vscode
    slack
    google-chrome
    microsoft-edge
    xclip
    unzip
    unrar
    mysql-workbench
    gparted
    neofetch
  ];
}
