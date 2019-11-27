{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.sway;
  url = "https://github.com/colemickens/nixpkgs-wayland/archive/master.tar.gz";
  waylandOverlay = (import (builtins.fetchTarball url));
in {
  options.programs.sway = {
    enableQtwayland = mkEnableOption "Qt via qt5.qtwayland";
    enableXwayland = mkEnableOption "X.org via xwayland";
  };

  config = {
    nixpkgs.overlays = [ waylandOverlay ];

    programs.sway = {
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export _JAVA_AWT_WM_NONREPARENTING=1
        export BEMENU_BACKEND=wayland
      '' + (optionalString cfg.enableQtwayland ''
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      '');
      extraPackages = with pkgs;
        [
          # supporting libraries
          libnotify

          # sway components
          swaybg # required by sway for controlling desktop wallpaper
          swayidle # used for controlling idle timeouts and triggers (screen locking, etc)
          swaylock # used for locking Wayland sessions

          # wayland programs
          gebaar-libinput # libinput gestures utility
          glpaper # GL shaders as wallpaper
          grim # screen image capture
          i3status-rust # cool bar
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
        ] ++ (optional cfg.enableXwayland xwayland)
        ++ (optional cfg.enableQtwayland qt5.qtwayland);
    };

    home-manager.users.brightone = {
      xdg.configFile."sway/config".source = ./.config/sway/config;
      xdg.configFile."swaylock/config".source = ./.config/swaylock/config;
      xdg.configFile."i3statusbar.toml".source = ./.config/i3statusbar.toml;
    };
  };
}
