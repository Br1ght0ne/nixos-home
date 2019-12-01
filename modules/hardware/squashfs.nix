{ config, lib, pkgs, ... }:

with lib;

let cfg = config.hardware.squashfs;
in {
  options.hardware.squashfs = { enable = mkEnableOption "squashfs support"; };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ squashfsTools squashfuse ];
  };
}
