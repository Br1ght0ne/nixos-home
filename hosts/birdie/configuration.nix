{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/purpose/workstation.nix
    ../../profiles/purpose/gaming.nix
  ];

  networking.hostName = "birdie";

  # FIXME: fingerprinting is broken
  # services.fprintd.enable = true;
}
