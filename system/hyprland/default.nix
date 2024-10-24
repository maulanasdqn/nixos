{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = false;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
