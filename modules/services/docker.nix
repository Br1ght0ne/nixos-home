{ config, lib, pkgs, ... }:

with lib;

let cfg = config.services.docker;
in {
  options.services.docker = {
    enable = mkEnableOption "Docker container daemon";

    extraPackages = mkOption {
      default = with pkgs; [ docker-compose lazydocker ];
      type = with types; listOf package;
      example = [ dive docker-machine ];
    };

    addUserToDockerGroup = mkOption {
      default = true;
      type = types.bool;
    };
  };

  config = {
    environment.systemPackages = cfg.extraPackages;

    users.users.brightone.extraGroups =
      optional cfg.addUserToDockerGroup "docker";

    virtualisation.docker.enable = true;
  };
}
