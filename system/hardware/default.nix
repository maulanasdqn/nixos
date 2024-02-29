{ config, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a9dbf275-6ac4-431f-b594-a53a81f8a915";
    fsType = "f2fs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/EB3E-4DC2";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/1c7a3dc1-4f4a-426e-ad64-d6267c8fce9a"; }];

  networking.useDHCP = lib.mkDefault true;

  hardware.nvidia = {
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
