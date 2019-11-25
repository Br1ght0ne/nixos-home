{ config, lib, pkgs, ... }:

{
  home-manager.users.brightone.home.packages = with pkgs; [
    docker-compose
    lazydocker
  ];

  users.users.brightone.extraGroups = [ "docker" ];

  # Enable Docker support.
  virtualisation.docker.enable = true;
}
