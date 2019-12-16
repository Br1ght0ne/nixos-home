{ config, lib, pkgs, ... }:
with lib;
let cfg = config.programs.emacs;
in {
  options.programs.emacs = {
    useHead = mkEnableOption "building Emacs 27 from source";
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = mkIf cfg.useHead [
      (import (builtins.fetchTarball {
        url =
          "https://github.com/nix-community/emacs-overlay/archive/29f935f0e15c5a74051ac01731c01516cdfde3a8.tar.gz";
      }))
    ];

    programs = {
      emacs = {
        package = if cfg.useHead then pkgs.emacsGit else pkgs.emacs;
        extraPackages = epkgs: [ epkgs.emacs-libvterm ];
      };
      zsh = {
        envExtra = ''
          export PATH="$HOME/.emacs.d/bin:$PATH"
        '';
        sessionVariables.EDITOR = "emacs";
      };
    };

    home.file = {
      ".doom.d" = {
        source = ./.doom.d;
        recursive = true;
      };
    };
  };
}
