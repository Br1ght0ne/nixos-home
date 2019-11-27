{
  imports =
    [ ./hardware-configuration.nix ../../profiles/purpose/workstation.nix ];

  networking.hostName = "birdie";

  # FIXME: fingerprinting is broken
  # services.fprintd.enable = true;
}
