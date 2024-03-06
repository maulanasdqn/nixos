{ pkgs, ... }: {

  virtualisation.docker.enable = true;

  nixpkgs = {
    config = { allowUnfree = true; };
    overlays = [ (import ../overlays) ];
  };

  environment = {
    variables = { EDITOR = "vim"; };
    systemPackages = with pkgs; [ vim curl git wget ];
    sessionVariables = { LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib"; };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "ms" ];
    substituters = [
      "https://cache.nixos.org"
      "https://cache.komunix.org/"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
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
    ./ld
  ];
}
