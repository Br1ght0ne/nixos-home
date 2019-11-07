{ config, pkgs, ... }:

{
  imports = [ ./home ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  environment = {
    pathsToLink = [ "share/zsh" ];
    systemPackages = with pkgs; [
      acl
      bash
      binutils
      file
      gawk
      gcc9
      git
      gnumake
      home-manager
      lsb-release
      ncdu
      nix-index
      patchelf
      pavucontrol
      pciutils
      pmutils
      unzip
      vim
      wget
      xorg.xbacklight
      xorg.xmodmap
      xorg.xrdb
    ];
  };

  fonts.fonts = with pkgs; [
    dejavu_fonts
    fira-code
    fira-code-symbols
    font-awesome_5
    iosevka
    material-icons
    # nerdfonts
    noto-fonts-cjk
  ];

  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    # Support 32-bit libraries.
    opengl.driSupport32Bit = true;
  };

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
  };

  programs = {
    dconf.enable = true;
    iotop.enable = true;
    mosh.enable = true;
    mtr.enable = true;
    light.enable = true;
    thefuck.enable = true;
  };

  # Users in 'wheel' can sudo without password.
  security.sudo.wheelNeedsPassword = false;

  services = {
    bitlbee = {
      enable = true;
      libpurple_plugins = with pkgs; [ telegram-purple ];
      plugins = with pkgs; [ bitlbee-discord ];
    };
    dbus.packages = [ pkgs.gnome3.dconf ];
    geoclue2.enable = true;
    flatpak.enable = true;
    xserver = {
      enable = true;
      # Enable touchpad support.
      libinput.enable = true;
      windowManager.bspwm.enable = true;
    };
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  time.timeZone = "Europe/Kiev";

  # Enable Docker support.
  virtualisation.docker.enable = true;

  # Enable the GTK portal (for Flatpak).
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.03"; # Did you read the comment?
}
