{
  imports = [ ./bspwm.nix ./dunst.nix ./polybar.nix ./sxhkd.nix ];

  services = {
    compton.enable = true;
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
    keybase.enable = true;
    network-manager-applet.enable = true;
    pasystray.enable = true;
    redshift = {
      enable = true;
      provider = "geoclue2";
      tray = true;
    };
    unclutter = {
      enable = true;
      timeout = 3;
    };
  };
}
