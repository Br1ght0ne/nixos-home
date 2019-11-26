{ config, lib, pkgs, ... }:

with lib;

let cfg = config.programs.next;
in {
  options.programs.next = {
    enable = mkEnableOption "Next browser";
    viMode = mkOption {
      default = true;
      type = types.bool;
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile."next/init.lisp".text = concatStringsSep "\n" [
      "(in-package :next)"
      (optionalString cfg.viMode
        "(add-to-default-list 'vi-normal-mode 'buffer 'default-modes)")
    ];
    home.packages = [ pkgs.next ];
  };
}
