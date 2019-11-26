{ config, lib, pkgs, ... }:

{
  programs.sway = {
    extraSessionCommands = ''
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    '';
    extraPackages = with pkgs; [ qt5.qtwayland ];
  };
}
