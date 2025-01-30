{
  pkgs,
  inputs,
  lib,
  ...
}: {
  virtualisation = {
    libvirtd.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
    };

    oci-containers = {
      backend = "podman";
      containers = {
        open-webui = import ./containers/open-webui.nix;
      };
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "codeium"
        ];
    };
  };

  environment = {
    variables = {EDITOR = "vim";};
    systemPackages = [
      pkgs.adwaita-icon-theme
      pkgs.vim
      pkgs.curl
      pkgs.git
      pkgs.wget
      pkgs.devenv
      pkgs.gcc
      pkgs.libgcc
      pkgs.gnumake
      pkgs.cmake
      pkgs.openssl
      pkgs.pkg-config
      pkgs.extra-cmake-modules
      inputs.alejandra.defaultPackage.${pkgs.system}
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XCURSOR_SIZE = "42";
      XDG_SESSION_TYPE = "wayland";
      XCURSOR_THEME = "Adwaita";
      HYPRCURSOR_THEME = "Adwaita";
      HYPRCURSOR_SIZE = "24";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };

  services.gnome.gnome-keyring.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.virt-manager.enable = true;

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
