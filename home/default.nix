{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  home-manager.useUserPackages = true;

  # Disable ad-hoc user management.
  users.mutableUsers = false;

  users.users.brightone = {
    isNormalUser = true;
    extraGroups = [ "audio" "docker" "networkmanager" "video" "wheel" ];
    hashedPassword = "$6$Hbwcp8inqhM0K$cuw2YW25pwTVSJcxOwRLuDszM1InXXeMSGXNLSXMAd7DWQayTUXwinXEOQZ1vydbafDqFHle0eVZPqAuMzRBw0";
    shell = pkgs.zsh;
  };

  home-manager.users.brightone = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;

    imports = [
      ./email.nix
      ./packages.nix
      ./programs
      ./services
      ./themes.nix
    ];
  };
}
