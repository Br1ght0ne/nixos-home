{ lib, ... }:

{
  hardware.bluetooth.enable = true;
  services.illum.enable = true;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
