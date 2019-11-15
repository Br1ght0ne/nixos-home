{ config, lib, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ../../configuration.nix
    ../../modules/hardware/boot/efi.nix
    ../../modules/mysql.nix
    ../../modules/sway
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  networking.hostName = "birdie";

  services.fprintd.enable = true;
  services.illum.enable = true;

  hardware.bluetooth.enable = true;

  home-manager.users.brightone = {
    services = {
      sxhkd.keybindings = { "super + Delete" = "betterlockscreen -l dimblur"; };
    };
  };
}
