{ pkgs, ... }:

{

imports = [
  # Caches.
  ./cachix.nix
  # Enable system-wide modules.
  ./modules
  # Home-manager and related stuff.
  <home-manager/nixos>
  ./home
  # The host-specific configuration.
  ./host-configuration.nix
  # Any overrides you might want (temporarily).
  ./overrides.nix
];

boot.cleanTmpDir = true;

boot.kernelPackages = pkgs.linuxPackages_latest;

environment.pathsToLink = [ "share/zsh" ];

environment.systemPackages = with pkgs; [
  acl
  bash
  binutils
  file
  gawk
  gcc9
  git
  gnumake
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

fonts.fonts = with pkgs; [
  dejavu_fonts
  fira-code
  fira-code-symbols
  font-awesome_5
  iosevka
  material-icons
  powerline-fonts
];

hardware.enableRedistributableFirmware = true;

hardware.pulseaudio.enable = true;
sound.enable = true;

hardware.pulseaudio.support32Bit = true;

sound.mediaKeys.enable = true;

hardware.squashfs.enable = true;

hardware.opengl.driSupport32Bit = true;

networking.networkmanager.enable = true;

networking.firewall.enable = false;

programs.cachix = {
  enable = true;
  # packagesToCache = [ ];
};

programs.dconf.enable = true;

programs.gnupg.agent.enable = true;

programs.iotop.enable = true;

programs.mosh.enable = true;

programs.mtr.enable = true;

programs.ssh.startAgent = true;

programs.thefuck.enable = true;

programs.zsh.enable = false;

security.sudo.wheelNeedsPassword = false;

services.bitlbee = {
  enable = true;
  libpurple_plugins = with pkgs; [ telegram-purple ];
  plugins = with pkgs; [ bitlbee-discord ];
};

services.borgbackup.jobs = {
  home = {
    paths = [
      "~/Backups"
      "~/dev"
      "~/gallery"
      "~/org"
      "~/priv"
    ];
    exclude = [
      "*/.git"
      "*/target"
      "*/_?build"
      "*/vendor"
      "*/tmp"
      "*/cache"
      "*/node_modules"
      "*/dev/contrib"
    ];
    repo = "19362@ch-s012.rsync.net:backups";
    extraArgs = "--remote-path=borg1";
    encryption = {
      mode = "repokey";
      passCommand = "${pkgs.pass} show borgbackup";
    };
    compression = "zstd";
    prune.keep = {
      within = "1d";
      daily = 7;
      weekly = 4;
      monthly = -1;
    };
    startAt = "16:00";
    user = "brightone";
    group = "nogroup";
  };
};

services.dbus.packages = [ pkgs.gnome3.dconf ];

services.flatpak.enable = true;

xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};

services.geoclue2.enable = true;

services.tor = {
  enable = true;
  client.enable = true;
};

time.timeZone = "Europe/Kiev";

# This value determines the NixOS release with which your system is to be
# compatible, in order to avoid breaking some software such as database
# servers. You should change this only after NixOS release notes say you
# should.
system.stateVersion = "20.03"; # Did you read the comment?

}
