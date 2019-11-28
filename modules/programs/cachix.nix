{ config, lib, pkgs, ... }:

with lib;

let cfg = config.programs.cachix;
in {
  options.programs.cachix = {
    enable = mkEnableOption "Cachix";

    # packagesToCache = mkOption {
    #   default = [ ];
    #   type = with types; listOf package;
    #   example = with pkgs; [ emacs ];
    # };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ cachix ];

  };
}
