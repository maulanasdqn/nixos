{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelModules = ["kvm-amd"];
  boot.kernelParams = ["psmouse.synaptics_intertouch=0"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/28040736-5467-492f-bd8f-f8bdce4b06c6";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9965-FB67";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
    ];
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
