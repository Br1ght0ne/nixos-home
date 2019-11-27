{ config, pkgs, ... }:

{
  home-manager.useUserPackages = false;
  environment.homeBinInPath = true;

  users = {
    # Disable ad-hoc user management.
    mutableUsers = false;

    users.brightone = {
      isNormalUser = true;
      extraGroups =
        [ "audio" "camera" "input" "networkmanager" "video" "wheel" ];
      hashedPassword =
        "$6$Hbwcp8inqhM0K$cuw2YW25pwTVSJcxOwRLuDszM1InXXeMSGXNLSXMAd7DWQayTUXwinXEOQZ1vydbafDqFHle0eVZPqAuMzRBw0";
      shell = pkgs.zsh;
    };
  };

  home-manager.users.brightone = { pkgs, ... }: {
    imports = [ ./email.nix ./files ./packages.nix ./programs ./themes.nix ];

    nixpkgs.config.allowUnfree = true;

    programs = {
      asdf.enable = false;
      next.enable = true;
      ruby = {
        enable = true;
        useAsdf = false;
      };
    };
  };
}
