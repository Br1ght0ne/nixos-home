{ pkgs, ... }:

{
  imports = [
    # Enable system-wide modules.
    ./modules
    # Home-manager and related stuff.
    ./home
    # The host-specific configuration.
    ./machine.nix
    # Any overrides you might want (temporarily).
    ./overrides.nix
  ];

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
      pavucontrol
      pciutils
      pmutils
      psmisc
      unzip
      vim
      wget
    ];
  };

  fonts.fonts = with pkgs; [
    dejavu_fonts
    fira-code
    fira-code-symbols
    font-awesome_5
    iosevka
    material-icons
    noto-fonts-cjk
    powerline-fonts
    source-han-sans-japanese
  ];

  hardware = {
    enableRedistributableFirmware = true;
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
    gnupg.agent.enable = true;
    iotop.enable = true;
    mosh.enable = true;
    mtr.enable = true;
    light.enable = true;
    ssh.startAgent = true;
    thefuck.enable = true;
    # HACK: if true, conflicts with home-manager's zsh module,
    # making startup dramatically slower.
    zsh.enable = false;
  };

  # Users in 'wheel' can sudo without password.
  security.sudo.wheelNeedsPassword = false;

  services = with pkgs; {
    bitlbee = {
      enable = true;
      libpurple_plugins = [ telegram-purple ];
      plugins = [ bitlbee-discord ];
    };
    dbus.packages = [ gnome3.dconf ];
    geoclue2.enable = true;
    flatpak.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  time.timeZone = "Europe/Kiev";

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
