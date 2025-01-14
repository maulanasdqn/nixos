{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ms = {
    home.username = "ms";
    home.homeDirectory = "/home/ms";
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;
    imports = [
      ./zsh
      ./eww
      ./git
      ./tmux
      ./direnv
      ./starship
      ./packages
      ./hyprland
      ./dunst
      ./waybar
      ./foot
      ./wofi
      ./vscode
      ./rust
    ];
  };
}
