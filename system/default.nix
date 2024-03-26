{ pkgs, ... }: {

  virtualisation = {
    libvirtd = { enable = true; };
    docker = { enable = true; };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "nix-2.15.3" ];
    };
    overlays = [ (import ../overlays) ];
  };

  environment = {
    variables = { EDITOR = "vim"; };
    systemPackages = with pkgs; [ vim curl git wget xorg.xbacklight ];
    sessionVariables = { LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib"; };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "ms" "root" ];
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
