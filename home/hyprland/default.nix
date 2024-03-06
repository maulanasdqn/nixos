{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    swaybg
    wlsunset
    wl-clipboard
    sway
    slurp
    grim
  ];

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
