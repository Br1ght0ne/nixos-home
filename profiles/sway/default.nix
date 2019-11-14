{ config, lib, pkgs, ... }:

let
  url = "https://github.com/colemickens/nixpkgs-wayland/archive/master.tar.gz";
  waylandOverlay = (import (builtins.fetchTarball url));
in {
  nixpkgs.overlays = [ waylandOverlay ];

  programs.sway = {
    enable = true;
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export BEMENU_BACKEND=wayland
    '';
    extraPackages = with pkgs; [
      xwayland
      swaybg # required by sway for controlling desktop wallpaper
      swayidle # used for controlling idle timeouts and triggers (screen locking, etc)
      swaylock # used for locking Wayland sessions

      waybar # polybar-alike
      i3status-rust # simpler bar written in Rust

      gebaar-libinput # libinput gestures utility
      glpaper # GL shaders as wallpaper
      grim # screen image capture
      kanshi # dynamic display configuration helper
      mako # notification daemon
      oguri # animated background utility
      redshift-wayland # patched to work with wayland gamma protocol
      slurp # screen area selection tool
      waypipe # network transparency for Wayland
      wf-recorder # wayland screenrecorder
      wl-clipboard # clipboard CLI utilities
      wtype # xdotool, but for wayland

      # TODO: more steps required to use this?
      xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots
    ];
  };

  services.upower.enable = true;

  environment.systemPackages = with pkgs; [ cachix qt5.qtwayland ];

  home-manager.users.brightone = {
    xdg.configFile."sway/config".source = ./.config/sway/config;
    xdg.configFile."swaylock/config".source = ./.config/swaylock/config;
    xdg.configFile."i3statusbar.toml".source = ./.config/i3statusbar.toml;
  };
}
