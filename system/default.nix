{
  pkgs,
  inputs,
  ...
}: {
  virtualisation = {
    libvirtd = {enable = true;};
    docker = {enable = true;};
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = ["nix-2.15.3"];
    };
  };

  environment = {
    variables = {EDITOR = "vim";};
    systemPackages = [
      pkgs.vim
      pkgs.curl
      pkgs.git
      pkgs.wget
      inputs.alejandra.defaultPackage.${pkgs.system}
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    ];
    sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  services.gnome.gnome-keyring.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  fileSystems = {
    "/home/ms/HDD" = {
      device = "/dev/sda1";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };
    "/home/ms/HDD2" = {
      device = "/dev/sdb1";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };
    "/home/ms/NVME" = {
      device = "/dev/nvme0n1p3";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["ms" "root"];
    substituters = [
      "https://cache.nixos.org"
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
    ./fonts
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
    ./hyprland
    ./nixvim
  ];
}
