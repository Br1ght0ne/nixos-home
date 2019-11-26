{ pkgs, ... }:

let
  url = "https://github.com/colemickens/nixpkgs-wayland/archive/master.tar.gz";
  waylandOverlay = (import (builtins.fetchTarball url));
in {
  imports = [ ./i3statusbar.nix ./qt.nix ];

  nixpkgs.overlays = [ waylandOverlay ];

  programs.sway = {
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export _JAVA_AWT_WM_NONREPARENTING=1
      export BEMENU_BACKEND=wayland
    '';
    extraPackages = with pkgs; [
      # supporting libraries
      libnotify
      xwayland

      # sway components
      swaybg # required by sway for controlling desktop wallpaper
      swayidle # used for controlling idle timeouts and triggers (screen locking, etc)
      swaylock # used for locking Wayland sessions

      # wayland programs
      gebaar-libinput # libinput gestures utility
      glpaper # GL shaders as wallpaper
      grim # screen image capture
      imv # image viewer
      kanshi # dynamic display configuration helper
      mako # notification daemon
      oguri # animated background utility
      redshift-wayland # patched to work with wayland gamma protocol
      slurp # screen area selection tool
      waybar # polybar-alike
      waypipe # network transparency for Wayland
      wf-recorder # wayland screenrecorder
      wl-clipboard # clipboard CLI utilities
      wtype # xdotool, but for wayland
      xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots
    ];
  };

  home-manager.users.brightone = {
    xdg.configFile."sway/config".source = ./.config/sway/config;
    xdg.configFile."swaylock/config".source = ./.config/swaylock/config;
  };
}
