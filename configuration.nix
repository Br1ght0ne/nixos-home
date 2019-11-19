{ config, pkgs, ... }:

{
  imports = [ ./home ./overrides.nix ];

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
      qt5.qtwayland
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
    noto-fonts-cjk
    powerline-fonts
    source-han-sans-japanese
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
    gnupg.agent.enable = true;
    iotop.enable = true;
    mosh.enable = true;
    mtr.enable = true;
    light.enable = true;
    ssh.startAgent = true;
    sway = {
      enable = true;
      extraPackages = with pkgs; [
        swaylock
        swayidle
        xwayland
        i3status
        i3status-rust
      ];
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
      '';
    };
    thefuck.enable = true;
    zsh.enable = true;
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
