{ pkgs, ... }:

{

imports = [
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

hardware.opengl.driSupport32Bit = true;

networking.networkmanager.enable = true;

networking.firewall.enable = false;

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

services.dbus.packages = [ pkgs.gnome3.dconf ];

services.flatpak.enable = true;

xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
};

services.geoclue2.enable = true;

time.timeZone = "Europe/Kiev";

# This value determines the NixOS release with which your system is to be
# compatible, in order to avoid breaking some software such as database
# servers. You should change this only after NixOS release notes say you
# should.
system.stateVersion = "20.03"; # Did you read the comment?

}
