{ pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = import ../overlays;

  environment.systemPackages = with pkgs; [ vim curl git wget ];

  environment.variables.EDITOR = "vim";

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.settings.trusted-users = [ "ms" ];

  nix.settings = {
    substituters = [ "https://cache.nixos.org" "https://cache.komunix.org/" ];

    trusted-public-keys =
      [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
  };

  system.stateVersion = "23.11";

  imports = [
    ./hardware
    ./hyprland
    ./boot
    ./network
    ./locale
    ./timezone
    ./sound
    ./users
    ./security
    ./shell
    ./init
    ./services
  ];
}
