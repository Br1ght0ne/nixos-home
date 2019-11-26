{ config, lib, pkgs, ... }:

{
  programs.sway.enable = true;

  services = {
    docker.enable = true;
    mysql.enable = true;
  };
}
