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
          "https://github.com/nix-community/emacs-overlay/archive/08c01cc7b88f8564bd7ecb7cc387db922f19300e.tar.gz";
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
