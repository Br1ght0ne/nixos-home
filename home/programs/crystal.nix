{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.crystal; in
{
  options.programs.crystal = {
    enable = mkEnableOption "Crystal language support";

    package = mkOption {
      default = pkgs.crystal;
      type = types.package;
    };

    extraPackages = mkOption {
      default = with pkgs; [ crystal2nix icr scry ];
      type = with types; listOf package;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ crystal shards ] ++ cfg.extraPackages;
  };
}
