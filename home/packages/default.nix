{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
    htop
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
