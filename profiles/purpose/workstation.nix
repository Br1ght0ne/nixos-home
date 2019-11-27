{ config, lib, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    enableQtwayland = true;
    enableXwayland = true;
  };

  services = {
    docker.enable = true;
    mysql.enable = true;
  };
}
